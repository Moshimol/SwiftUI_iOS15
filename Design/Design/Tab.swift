//
//  Tab.swift
//  Design
//
//  Created by lushitong on 2022/4/17.
//

import SwiftUI

// 创建数据模型
struct TabItem : Identifiable {
    var id = UUID()
    var text: String
    var icon: String
}

var tabItems = [
    TabItem(text: "Learn Now", icon: "house"),
    TabItem(text: "Explore", icon: "magnifyingglass"),
    TabItem(text: "Notifications", icon: "bell"),
    TabItem(text: "Library", icon: "rectangle.stack")
]
