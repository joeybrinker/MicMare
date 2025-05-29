//
//  Models.swift
//  PresentationTest
//
//  Created by Joseph Brinker on 5/12/25.
//

import Foundation
import SwiftUI

struct Slide {
    let title: String
    let content: String
    
    init(title: String, content: String) {
        self.title = title
        self.content = content
    }
}

struct Presentation {
    let slides: [Slide]
    
    init(slides: [Slide]) {
        self.slides = slides
    }
}

struct Presentations {
    var presentations: [Presentation]
    
    init(presentations: [Presentation]) {
        self.presentations = presentations
    }
}
