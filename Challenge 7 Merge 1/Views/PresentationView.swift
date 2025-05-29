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
    
    @State var timePresenting: Int = 0
    
    @State private var presentationIndex = 0
    
    @State var throwTomato: Bool = false
    
    @State var throwIndex = 1
    
    // Create a timer that publishes every second
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color.backgroundGray
                    .ignoresSafeArea()
                VStack{
                    
                    presentationView
                    
                    Text("\(timePresenting)")
                        .foregroundStyle(.white)
                    
                    Spacer()
                    
                    ZStack{
                        
                        stage
                        
                        buttons
                            .font(.title)
                            .padding(.horizontal)
                    }
                    .ignoresSafeArea()
                }
                .ignoresSafeArea(.all)
                .padding(.top)
                
                if presentationIndex == throwIndex {
                    LottieView(name: "tomato", isVisible: $throwTomato)
                        .frame(width: 400, height: 400)
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
                    
                    NavigationLink("Finish", destination: FinalView(timePassed: timePresenting))
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
        return Int.random(in: 1..<presentation!.slides.count)
    }
}

#Preview {
    PresentationView()
}
