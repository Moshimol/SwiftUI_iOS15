//
//  PreferenceKeys.swift
//  Design
//
//  Created by lushitong on 2022/4/18.
//

import SwiftUI

struct ScrollerPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue:() -> CGFloat) {
        value = value > 0 ? value : nextValue()
    }
}
