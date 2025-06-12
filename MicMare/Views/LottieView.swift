//
//  LottieView.swift
//  Challenge 7 Merge 1
//
//  Created by Joseph Brinker on 5/22/25.
//


import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    var name: String
    var loopMode: LottieLoopMode // Changed default to play once
    var animationSpeed: CGFloat = 1.0
    var contentMode: UIView.ContentMode = .scaleAspectFit
    @Binding var isVisible: Bool // Add binding to control visibility
    var onComplete: (() -> Void)? // Optional completion handler
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView(frame: .zero)
        
        let animationView = LottieAnimationView()
        animationView.animation = LottieAnimation.named(name)
        animationView.contentMode = contentMode
        animationView.loopMode = loopMode
        animationView.animationSpeed = animationSpeed
        
        // Add completion handler
        animationView.play { completed in
            if completed {
                // Animation finished successfully
                DispatchQueue.main.async {
                    self.onComplete?() // Call the completion handler
                    if self.loopMode == .playOnce {
                        self.isVisible = false // Auto-hide when complete
                    }
                }
            }
        }
        
        // Save animation view for updates
        context.coordinator.animationView = animationView
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {
        // Handle updates if needed
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    // Add coordinator to hold references
    class Coordinator: NSObject {
        var parent: LottieView
        var animationView: LottieAnimationView?
        
        init(_ parent: LottieView) {
            self.parent = parent
        }
    }
}
