//
//  FinalView.swift
//  Challenge 7 Merge 1
//
//  Created by Joseph Brinker on 5/13/25.
//

import SwiftUI

struct FinalView: View {
    
    let timePassed: Int // this is given to us from PresentationView
    @State var totalTime: Int = 0
        
    var body: some View {
        NavigationStack{
            ZStack{
                LinearGradient(colors: [.backgroundGold, .gradientTop], startPoint: .bottom, endPoint: .top)
                    .ignoresSafeArea()
                
                VStack(spacing: 30){
                    
                    Text("Results")
                        .foregroundStyle(.textBlue)
                        .font(Font.custom("SF Compact Display", size: 35) .weight(.bold))

                    Text("SEE!!!!\nThat wasn’t that bad right?\nYou got through it!")
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
                    
                    ZStack{
                        Capsule()
                            .foregroundStyle(.backgroundGray)
                        NavigationLink("Play Again", destination: ContentView())
                            .font(.system(size: 20) .weight(.bold))
                            .foregroundStyle(.textGold)
                    }
                    .frame(width: 180, height: 60)
                }
            }
        }
        .onAppear {
            totalTime = timePassed
        }
        .navigationBarBackButtonHidden(true)
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
    FinalView(timePassed: 1234)
}
