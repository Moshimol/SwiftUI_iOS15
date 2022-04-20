//
//  Animations.swift
//  Design
//
//  Created by lushitong on 2022/4/20.
//

import SwiftUI

extension Animation {
    static let openCard = Animation.spring(response: 0.5, dampingFraction: 0.7)
    static let closeCard = Animation.spring(response: 0.6, dampingFraction: 0.9)
    
    static let tabBarHidden = Animation.spring(response: 0.5, dampingFraction: 0.7)
    static let tabBarShow = Animation.spring(response: 0.5, dampingFraction: 0.7)
}
