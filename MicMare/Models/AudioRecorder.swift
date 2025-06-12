//
//  AudioRecorder.swift
//  MicMare
//
//  Created by Joseph Brinker on 6/12/25.
//

import Foundation
import AVFAudio
import Combine

class AudioRecorder: ObservableObject {
    @Published var isRecording = false
    @Published var recordingURL: URL?
    
    private var audioRecorder: AVAudioRecorder?
    private var audioSession: AVAudioSession = AVAudioSession.sharedInstance()
    
    init() {
        setupAudioSession()
    }
    
    private func setupAudioSession() {
        do {
            try audioSession.setCategory(.playAndRecord, mode: .default)
            try audioSession.setActive(true)
        } catch {
            print("Failed to setup audio session: \(error)")
        }
    }
    
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func startRecording() {
        // Request permission first
        AVAudioApplication.requestRecordPermission { [weak self] allowed in
            DispatchQueue.main.async {
                if allowed {
                    self?.beginRecording()
                } else {
                    print("Recording permission denied")
                }
            }
        }
    }
    
    private func beginRecording() {
        // Create temporary URL for recording
        let audioFilename = getDocumentsDirectory().appendingPathComponent("temp_recording.m4a")
        
        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        
        do {
            audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings)
            audioRecorder?.record()
            isRecording = true
            recordingURL = audioFilename
            print("Recording started")
        } catch {
            print("Could not start recording: \(error)")
        }
    }
    
    func stopRecording() {
        audioRecorder?.stop()
        isRecording = false
        print("Recording stopped")
    }
    
    func deleteRecording() {
        guard let url = recordingURL else { return }
        
        do {
            try FileManager.default.removeItem(at: url)
            recordingURL = nil
            print("Recording deleted")
        } catch {
            print("Could not delete recording: \(error)")
        }
    }
}
