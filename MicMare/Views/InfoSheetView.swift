//
//  InfoSheetView .swift
//  MicMare
//
//  Created by Yesmina on 6/16/25.
//

import SwiftUI

struct InfoSheetView: View {
    var body: some View {
            ZStack{
                Color.backgroundGray
                    .ignoresSafeArea()
                VStack(spacing: 0){
                    Image("PullForChallenge")
                        .padding(.top)
                    
                    ZStack {
                        VStack {
                            Image("slotCopy1")
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: 200, maxHeight: 200)
                                .padding()
                                .padding(.bottom)
                            ZStack{
                                Capsule()
                                    .frame(width: 180, height: 60)
                                    .foregroundStyle(.textGold)
                                Text("Warm Up?")
                                    .font(.system(size: 20).weight(.bold))
                                    .foregroundStyle(.black)
                            }
                        }
                            
                            Image("Writing")
                    }
                }
            }
        }
    }


#Preview {
    InfoSheetView()
}
