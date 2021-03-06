//
//  DesignApp.swift
//  Design
//
//  Created by lushitong on 2022/4/17.
//

import SwiftUI

@main
struct DesignApp: App {
    @StateObject var model = Model()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
        }
    }
}
