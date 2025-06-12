//
//  SplashView.swift
//  Challenge 7 Merge 1
//
//  Created by Joseph Brinker on 5/28/25.
//

import SwiftUI

struct SplashView: View {
    @State private var showSplash = true
    
    var body: some View {
    ZStack {
        Color.backgroundGray
        .ignoresSafeArea()
            if showSplash {
                LottieView(name: "duckintro2", loopMode: .playOnce, isVisible: $showSplash)
         .onAppear {
                        // Change the splash state after 2 seconds
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                        withAnimation {
                        showSplash = false
                            }
                        }
                    }
            } else {
                ContentView()
                
            }
        }
    }
}

#Preview {
    SplashView()
}
