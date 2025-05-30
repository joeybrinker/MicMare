//
//  BreatheView.swift
//  Challenge 7 Merge 1
//
//  Created by Joseph Brinker on 5/13/25.
//

import SwiftUI
import Combine

struct BreatheView: View {
    
    @Environment(\.dismiss) private var dismiss // Dismiss the view
    
    let timerSequence = [4, 7, 8]
    let breatheSequence = ["Breath In", "Hold", "Breath Out"]
    
    @State private var currentSequenceIndex = 0
    @State private var timeRemaining: Int
    @State private var timerRunning = false
    @State private var sequenceCompleted = false
    @State private var showNextScreen = false
    
    @State private var circle: CGFloat = 280
    
    let defaultSize: CGFloat = 250
    let maxCircleSize : CGFloat = 360
    let frameRate: CGFloat = 0.01
    
    var growthRate: CGFloat {
        (maxCircleSize - defaultSize) / CGFloat(timerSequence[currentSequenceIndex] + 1) * frameRate
    }
    
//    // Create a timer that publishes every second
//    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
//    
//    let animationTimer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    
    @State private var timerCancellable: AnyCancellable?
    @State private var animationCancellable: AnyCancellable?
    
    // Initialize with the first countdown value
    init(){
        _timeRemaining =  State(initialValue: timerSequence[0])
    }
    
    var body: some View {
        NavigationStack{
            ZStack{
                LinearGradient(colors: [.backgroundGold, .gradientTop], startPoint: .bottom, endPoint: .top)
                    .ignoresSafeArea()
                
                VStack {
                        Text("\(breatheSequence[currentSequenceIndex])")
                        .font(Font.custom("SF Compact Display", size: 35).weight(.bold))
                        .foregroundStyle(.textBlue)
                        .padding()
                    
                    Spacer()
                    
                    ZStack{
                        Circle()
                            .foregroundStyle(.white.opacity(0.3))
                            .frame(width: circle)
                        Circle()
                            .foregroundStyle(.white.opacity(0.4))
                            .frame(width: circle * 0.75)
                        Circle()
                            .foregroundStyle(.white.opacity(0.6))
                            .frame(width: circle * 0.5)
                        Circle()
                            .foregroundStyle(.white)
                            .frame(width: circle * 0.25)
                        Text("\(timeRemaining)")
                            .font(Font.custom("SF Compact Display", size: 50).weight(.semibold))
                            .foregroundStyle(.black)
                    }
                    
                    Spacer()
                    HStack{
                        Button {
                            if timerRunning {
                                stopTimers()
                                resetTimer()
                                circle = defaultSize
                            }
                            else {
                                //Start Timer
                                timerRunning.toggle()
                                startTimers()
                            }
                        } label: {
                            ZStack {
                                Capsule()
                                    .frame(width: 120, height: 60)
                                Text(timerRunning ? "Reset" : "Start")
                                    .foregroundStyle(timerRunning ? .white : .backgroundGold)
                                    .font(.system(size: 20).weight(.bold))

                            }
                        }
                        .foregroundStyle(timerRunning ? .buttonRed : .backgroundGray)
                        
                        Spacer()
                            .frame(width: 80)
                        
                        ZStack {
                            Capsule()
                                .frame(width: 120, height: 60)
                                .foregroundStyle(.white)
                            
                            NavigationLink("Continue", destination: PresentationView())
                                .onTapGesture {
                                    resetTimer()
                                }
                                .foregroundStyle(.black)
                                .font(.system(size: 20).weight(.bold))
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    stopTimers()
                    dismiss()
                } label: {
                    ZStack{
                        Capsule()
                            .frame(width: 80, height: 40)
                            .foregroundStyle(.textBlue)
                        Text("Back")
                            .foregroundStyle(.black)
                            .fontWeight(.bold)
                    }
                }
            }
        }
//        .onReceive(timer) { _ in
//            updateTimer()
//        }
//        .onReceive(animationTimer) { _ in
//            // Per Frame
//            guard timerRunning else { return }
//            
//            if circle < maxCircleSize && currentSequenceIndex == 0 {
//                circle += growthRate
//            }
//            if currentSequenceIndex == 2 {
//                if circle > defaultSize {
//                    circle -= growthRate
//                }
//            }
//        }
        .onAppear {
            resetTimer()
            circle = defaultSize
        }
        .onDisappear {
            stopTimers()
        }

    }
    
    private func startTimers() {
        // Start the 1-second countdown timer
        timerCancellable = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { _ in
                updateTimer()
            }
        
        // Start the animation timer (60fps)
        animationCancellable = Timer.publish(every: 0.01, on: .main, in: .common)
            .autoconnect()
            .sink { _ in
                guard timerRunning else { return }
                
                if circle < maxCircleSize && currentSequenceIndex == 0 {
                    circle += growthRate
                }
                if currentSequenceIndex == 2 {
                    if circle > defaultSize {
                        circle -= growthRate
                    }
                }
            }
    }

    private func stopTimers() {
        timerCancellable?.cancel()
        animationCancellable?.cancel()
        timerCancellable = nil
        animationCancellable = nil
    }
    
    private func updateTimer() {
        guard timerRunning else { return }
        
        if timeRemaining > 0 {
            timeRemaining -= 1
        }
        else {
            if currentSequenceIndex < timerSequence.count - 1 {
                currentSequenceIndex += 1
                timeRemaining = timerSequence[currentSequenceIndex]

            } else {
                timerRunning = false
                sequenceCompleted = true
                resetTimer()
            }
        }
    }
    
    private func resetTimer() {
        stopTimers()  // Add this line
        timerRunning = false
        currentSequenceIndex = 0
        timeRemaining = timerSequence[0]
        sequenceCompleted = false
        circle = defaultSize  // Add this line to ensure circle resets
    }
}

#Preview {
    BreatheView()
}
