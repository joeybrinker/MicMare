//
//  TongueTwisterView.swift
//  Challenge 7 Merge 1
//
//  Created by Joseph Brinker on 5/13/25.
//

import SwiftUI

struct TongueTwisterView: View {
    @Environment(\.dismiss) private var dismiss // Dismiss the view
    
    @State private var text: String = tongueTwisters.randomElement()!
    
    var body: some View {
        NavigationStack{
            ZStack {
                
                Color.backgroundGray
                    .ignoresSafeArea()
                
                VStack{
                    
                    Text("Tongue Twisters")
                        .foregroundStyle(.backgroundGold)
                        .font(.system(size: 35))
                        .fontWeight(.bold)
                        
                    Text("Repeat 5 times")
                        .foregroundStyle(.backgroundGold)
                        .font(.system(size: 35))
                        .fontWeight(.bold)
                    
                    Text(text)
                        .font(.system(size: 48))
                        .fontWeight(.medium)
                        .foregroundStyle(.white)
                        .frame(width: 300, height: 350)
                        .multilineTextAlignment(.center)
                        .allowsTightening(true)
                        .minimumScaleFactor(0.6)
                        .padding()
                    
                    Button {
                        let oldText = text
                        text = tongueTwisters.randomElement()!
                        
                        // Never generate the same tongue twister
                        while oldText == text {
                            text = tongueTwisters.randomElement()!
                        }
                        
                    } label: {
                        ZStack{
                            Capsule()
                                .frame(width: 180, height: 60)
                                .foregroundStyle(.backgroundGold)
                            Text("Generate More")
                                .foregroundStyle(.backgroundGray)
                                .font(.system(size: 20).weight(.bold))
                        }
                    }
                    
                    Button {
                        dismiss()
                    } label: {
                        ZStack{
                            Capsule()
                                .frame(width: 150, height: 60)
                                .foregroundStyle(.buttonRed)
                            Text("Go Back")
                                .foregroundStyle(.backgroundGray)
                                .font(.system(size: 20).weight(.bold))
                        }
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    TongueTwisterView()
}
