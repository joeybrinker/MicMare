//
//  FinalView.swift
//  Challenge 7 Merge 1
//
//  Created by Joseph Brinker on 5/13/25.
//

import SwiftUI

struct FinalView: View {
    
    let timePassed: Int // this is given to us from PresentationView
    let recordingURL: URL? // Optional recording URL
    @State var totalTime: Int = 0
    
    // Audio playback
    @StateObject private var audioPlayer = AudioPlayer()
    @State private var hasAudioLoaded = false
        
    var body: some View {
        NavigationStack{
            ZStack{
                LinearGradient(colors: [.backgroundGold, .gradientTop], startPoint: .bottom, endPoint: .top)
                    .ignoresSafeArea()
                
                VStack(spacing: 30){
                    
                    Text("Results")
                        .foregroundStyle(.textBlue)
                        .font(.system(size: 35))
                        .fontWeight(.bold)

                    Text("SEE!!!!\nThat wasn't that bad right?\nYou got through it!")
                        .foregroundStyle(.stageRed)
                        .font(.system(size: 25, weight: .bold))
                        .multilineTextAlignment(.center)
                    
                    ZStack{
                        Capsule()
                            .frame(width: 320, height: 130)
                            .foregroundStyle(.backgroundPresentation)
                        VStack{
                            
                            Text("Time Taken:")
                                .foregroundStyle(.backgroundGray)
                                .fontWeight(.bold)
                            
                            Text("\(timeFormatter(totalTime))")
                                .fontWeight(.bold)
                                .foregroundStyle(.textFinalTime)
                                .lineLimit(1)
                                .multilineTextAlignment(.center)
                                .allowsTightening(true)
                                .minimumScaleFactor(0.1)
                                .font(.title)
                        }
                        .font(.system(size: 25))
                    }
                    
                    // Audio playback section
                    if recordingURL != nil && hasAudioLoaded {
                        audioPlaybackSection
                    }
                    
                    ZStack{
                        Capsule()
                            .foregroundStyle(.backgroundGray)
                        NavigationLink("Play Again", destination: ContentView())
                            .onTapGesture {
                            // Clean up audio when navigating away
                            if audioPlayer.isPlaying {
                                audioPlayer.stop()
                            }
                            // Delete the temporary recording
                            deleteRecording()
                        }
                        .font(.system(size: 20) .weight(.bold))
                        .foregroundStyle(.textGold)
                    }
                    .frame(width: 180, height: 60)
                }
            }
        }
        .onAppear {
            totalTime = timePassed
            loadAudioIfAvailable()
        }
        .onDisappear {
            // Clean up when leaving the view
            if audioPlayer.isPlaying {
                audioPlayer.stop()
            }
            deleteRecording()
        }
        .navigationBarBackButtonHidden(true)
    }
    
    private var audioPlaybackSection: some View {
        VStack(spacing: 15) {
            Text("Your Recording")
                .font(.system(size: 20, weight: .bold))
                .foregroundStyle(.textBlue)
            
            // Playback controls
            HStack(spacing: 20) {
                Button(action: {
                    if audioPlayer.isPlaying {
                        audioPlayer.pause()
                    } else {
                        audioPlayer.play()
                    }
                }) {
                    Image(systemName: audioPlayer.isPlaying ? "pause.circle.fill" : "play.circle.fill")
                        .font(.system(size: 40))
                        .foregroundColor(.textBlue)
                }
                
                Button(action: {
                    audioPlayer.stop()
                }) {
                    Image(systemName: "stop.circle.fill")
                        .font(.system(size: 40))
                        .foregroundColor(.stageRed)
                }
            }
            
            // Progress bar
            VStack(spacing: 5) {
                HStack {
                    Text(timeFormatter(Int(audioPlayer.currentTime)))
                        .font(.caption)
                        .foregroundStyle(.backgroundGray)
                    
                    Spacer()
                    
                    Text(timeFormatter(Int(audioPlayer.duration)))
                        .font(.caption)
                        .foregroundStyle(.backgroundGray)
                }
                
                ProgressView(value: audioPlayer.currentTime, total: audioPlayer.duration)
                    .progressViewStyle(LinearProgressViewStyle(tint: .textBlue))
                    .frame(height: 4)
            }
            .padding(.horizontal, 20)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.white.opacity(0.9))
        )
        .padding(.horizontal, 20)
    }
    
    private func loadAudioIfAvailable() {
        guard let url = recordingURL else { return }
        
        // Check if file exists
        if FileManager.default.fileExists(atPath: url.path) {
            audioPlayer.loadAudio(from: url)
            hasAudioLoaded = true
        }
    }
    
    private func deleteRecording() {
        guard let url = recordingURL else { return }
        
        do {
            try FileManager.default.removeItem(at: url)
            print("Recording deleted from FinalView")
        } catch {
            print("Could not delete recording: \(error)")
        }
    }
    
    func timeFormatter(_ seconds: Int) -> String {
        let formatter = DateComponentsFormatter()
        if seconds < 3600 {
            formatter.allowedUnits = [.minute, .second]
        } else {
            formatter.allowedUnits = [.hour, .minute, .second]
        }
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        
        return formatter.string(from: TimeInterval(seconds)) ?? "00:00"
    }
}

#Preview {
    FinalView(timePassed: 1234, recordingURL: nil)
}
