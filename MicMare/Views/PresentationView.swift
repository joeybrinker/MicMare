//
//  PresentationView.swift
//  Challenge 7 Merge 1
//
//  Created by Joseph Brinker on 5/13/25.
//

import SwiftUI

struct PresentationView: View {
    @State var presentation = presentations.presentations.randomElement()
    @State var showNextScreen = false
    @State private var showSplashScreen: Bool = true
    @State var showAudience = true
    
    @State var timePresenting: Int = 0
    
    @State private var presentationIndex = 0
    
    @State var throwTomato: Bool = false
    
    @State var throwIndex = 1
    
    // Audio recording
    @StateObject private var audioRecorder = AudioRecorder()
    @State private var hasRecording = false
    
    // Create a timer that publishes every second
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color.backgroundGray
                    .ignoresSafeArea()
                VStack{
                    Spacer()
                    
                    audience
                    
                    stage
                }
                    .ignoresSafeArea(.container)
                    .padding(.top)
                    
                
                if presentationIndex == throwIndex {
                    LottieView(name: "tomato", loopMode: .playOnce, isVisible: $throwTomato)
                        .frame(width: 400, height: 400)
                }
                
                Triangle()
                    .fill(LinearGradient(colors: [.spotlightTop, .spotlightBottom], startPoint: .top, endPoint: .bottom).opacity(0.3))
                    .blur(radius: 7)

                VStack{
                    presentationView
                    
                    // Recording indicator
                    if audioRecorder.isRecording {
                        HStack {
                            Circle()
                                .fill(Color.red)
                                .frame(width: 12, height: 12)
                                .opacity(0.8)
                            Text("Recording...")
                                .foregroundColor(.red)
                                .font(.caption)
                                .fontWeight(.medium)
                        }
                        .padding(.top, 10)
                    }
                    Spacer()

                    buttons
                        .font(.title)
                        .padding(.horizontal)
                }

            }
            .onReceive(timer) { _ in
                timePresenting += 1
            }
            .navigationBarBackButtonHidden(true)
            .onAppear {
                presentationIndex = 0
                presentation = presentations.presentations.randomElement()
                throwIndex = getThrowIndex()
            }
            .onDisappear {
                // Clean up recording if user leaves the view
                if audioRecorder.isRecording {
                    audioRecorder.stopRecording()
                }
            }
        }
    }
    
    private var recordingButton: some View {
        Button(action: {
            if audioRecorder.isRecording {
                audioRecorder.stopRecording()
                hasRecording = true
            } else {
                audioRecorder.startRecording()
                hasRecording = false
            }
        }) {
            Image(systemName: audioRecorder.isRecording ? "stop.circle.fill" : "mic.circle.fill")
                .font(.system(size: 60))
                .foregroundColor(.white)

                .frame(width: 100)
                
        }
    }
    
    private var presentationView: some View{
        ZStack{
            
            RoundedRectangle(cornerRadius: 28)
                .foregroundStyle(.backgroundPresentation)
                .frame(width: 350, height: 200)
            
            VStack {
                Text(presentation?.slides[presentationIndex].title ?? "No Presentation")
                    .font(.title.weight(.medium))
                    .padding()
                    .lineLimit(1)
                    .allowsTightening(true)
                    .minimumScaleFactor(0.5)
                
                Spacer()
                
                Text(presentation?.slides[presentationIndex].content ?? "No Content")
                    .font(.headline)
                    .allowsTightening(true)
                    .minimumScaleFactor(0.5)
                
                Spacer()
            }
            .padding()
            .foregroundStyle(.stageRed)
            .multilineTextAlignment(.center)
            .frame(maxWidth: 350, maxHeight: 200)
        }
    }
    
    private var audience: some View {
        VStack(spacing: -150){
            HStack(spacing: 0){
                LottieView(name: "girl-lottie", loopMode: .loop, isVisible: $showAudience)
                LottieView(name: "character2 (1)", loopMode: .loop, isVisible: $showAudience)
                LottieView(name: "boy1", loopMode: .loop, isVisible: $showAudience)
            }
            .frame(height: 300)
            
            HStack(spacing: 70) {
                Image("Asset 11")
                    .resizable()
                    .frame(width: 70,height: 200)
                            
                Image("Asset 12")
                    .resizable()
                    .frame(width: 70,height: 200)
                            
                Image("Asset 14")
                    .resizable()
                    .frame(width: 70, height: 200)
            
            }
            .padding()
        }
    }
    
    private var buttons: some View {
        HStack {
            Button {
                presentationIndex -= 1
            } label: {
                ZStack{
                    Circle()
                        .foregroundStyle(.white)
                        .frame(width: 40)
                    Image(systemName: "chevron.backward")
                        .foregroundStyle(.backgroundGray)
                }
            }
            .disabled(presentationIndex == 0)
            
            Spacer()
            
            // Recording button
            recordingButton
            
            Spacer()
            
            if presentationIndex < (presentation?.slides.count ?? 0) - 1 {
                Button {
                    presentationIndex += 1
                    
                } label: {
                    ZStack{
                        Circle()
                            .foregroundStyle(.white)
                            .frame(width: 40)
                        Image(systemName: "chevron.forward")
                            .foregroundStyle(.backgroundGray)
                    }
                }
                .disabled(presentationIndex == (presentation?.slides.count ?? 0) - 1)
            }
            else {
                ZStack {
                    Capsule()
                        .frame(width: 100, height: 40)
                        .foregroundStyle(.white)
                    
                    NavigationLink("Finish", destination: FinalView(
                        timePassed: timePresenting,
                        recordingURL: hasRecording ? audioRecorder.recordingURL : nil
                    ))
                    .foregroundStyle(.backgroundGray)
                    .font(.system(size: 20).weight(.bold))
                    .frame(width: 100, height: 40)
                }
            }
        }
    }
    
    private var stage: some View {
        Rectangle()
            .foregroundStyle(.stageRed)
            .frame(height: 128)
    }
    
    func getThrowIndex() -> Int {
        return Int.random(in: 2..<presentation!.slides.count)
    }
}

#Preview {
    PresentationView()
}
