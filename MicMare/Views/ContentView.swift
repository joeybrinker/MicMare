import SwiftUI
import AVKit

struct ContentView: View {
    @State private var isFinished = false
    @State private var timeObserverToken: Any?
    @State private var navigateToBreathe = false
    @State private var showSheet = false
    
    @State var isAnimating: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack{
                Color.backgroundGray
                    .ignoresSafeArea()
                
                VStack(spacing: 0){
                    Image("PullForChallenge")
                        .padding(.top)
                    
                    SlotMachineView() {
                        navigateToBreathe = true
                    }
                    .frame(width: 500, height: 300)
                    
                    Spacer()
                        .frame(height: 50)
                    VStack {
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
                        Button {
                            showSheet.toggle()
                        } label: {
                            Image("questionMark")
                            
                        }
                        .padding()
                    }
                    .sheet(isPresented: $showSheet) {
                        InfoSheetView()
                            .presentationDragIndicator(.visible)
                    }
                    
                    
                    NavigationLink(destination: BreatheView(), isActive: $navigateToBreathe) {
                        EmptyView()
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ContentView()
}
