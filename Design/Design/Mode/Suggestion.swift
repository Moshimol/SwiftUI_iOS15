//
//  Suggestion.swift
//  Design
//
//  Created by lushitong on 2022/7/4.
//

import Foundation

struct Suggestion: Identifiable {
    let id = UUID()
    var text : String
    
}

var suggestions = [
    Suggestion(text: "Swift"),
    Suggestion(text: "OC"),
    Suggestion(text: "JS"),
    Suggestion(text: "SwiftUI")
]
