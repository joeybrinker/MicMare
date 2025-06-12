import SwiftUI
import AVKit

struct ContentView: View {
    @State private var isFinished = false
    @State private var timeObserverToken: Any?
    @State private var navigateToBreathe = false
    
    @State var isAnimating: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack{
                Color.backgroundGray
                    .ignoresSafeArea()
                
                VStack{
                    Text("Pull for your challenge")
                        .foregroundStyle(.textGold)
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                        .padding()
                    
                    
                    SlotMachineView() {
                        navigateToBreathe = true
                    }
                    .frame(width: 500, height: 300)
                    
                    Spacer()
                        .frame(height: 200)
                    
                    NavigationLink(destination: TongueTwisterView()) {
                        ZStack{
                            Capsule()
                                .frame(width: 180, height: 60)
                                .foregroundStyle(.textGold)
                            Text("Warm Up?")
                                .font(.system(size: 20).weight(.bold))
                                .foregroundStyle(.black)
                        }
                    }
                    
                    // Add navigation link to BreatheView that activates when the video finishes
                    NavigationLink(destination: BreatheView(), isActive: $navigateToBreathe) {
                        EmptyView()
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
//    func setupPlayerCompletion() {
//        removeObserver()
//        
//        NotificationCenter.default.addObserver(
//            forName: .AVPlayerItemDidPlayToEndTime,
//            object: player.currentItem,
//            queue: .main
//        ) { _ in
//            // When video finishes
//            isFinished = true
//            // Trigger navigation to BreatheView
//            navigateToBreathe = true
//        }
//    }
//        
//    func removeObserver() {
//        NotificationCenter.default.removeObserver(
//            self,
//            name: .AVPlayerItemDidPlayToEndTime,
//            object: player.currentItem
//        )
//    }
}

#Preview {
    ContentView()
}
