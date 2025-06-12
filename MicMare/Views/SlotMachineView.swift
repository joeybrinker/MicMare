//
//  SlotMachineView.swift
//  MicMare
//
//  Created by Joseph Brinker on 6/4/25.
//


import SwiftUI
import Lottie

struct SlotMachineView: UIViewRepresentable {
    //@Binding var isVisible: Bool
    @State private var hasBeenTapped = false
    var onComplete: (() -> Void)?
    
    func makeUIView(context: UIViewRepresentableContext<SlotMachineView>) -> UIView {
        let view = UIView(frame: .zero)
        
        let animationView = LottieAnimationView()
        animationView.animation = LottieAnimation.named("Slot Machine-lottie")
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .playOnce
        animationView.animationSpeed = 1.0
        
        // Don't play automatically - just show first frame
        animationView.currentProgress = 0
        
        // Add tap gesture
        let tapGesture = UITapGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handleTap))
        animationView.addGestureRecognizer(tapGesture)
        animationView.isUserInteractionEnabled = true
        
        context.coordinator.animationView = animationView
        context.coordinator.parent = self
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<SlotMachineView>) {
        // Handle updates if needed
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    class Coordinator: NSObject {
        var parent: SlotMachineView?
        var animationView: LottieAnimationView?
        
        @objc func handleTap() {
            guard let animationView = animationView,
                  let parent = parent else { return }
            
            // Play animation when tapped
            animationView.play { completed in
                if completed {
                    DispatchQueue.main.async {
                        parent.onComplete?()
                        //parent.isVisible = false
                    }
                }
            }
        }
    }
}
