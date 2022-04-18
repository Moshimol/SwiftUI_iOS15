//
//  HomeView.swift
//  Design
//
//  Created by lushitong on 2022/4/18.
//

import SwiftUI

struct HomeView: View {
    @State var hasScrolled = false
    
    var body: some View {
        ScrollView {
            GeometryReader {proxy in
                Color.clear.preference(key: ScrollerPreferenceKey.self, value: proxy.frame(in: .named("scroll")).minY)
            }
            .frame(height:0)
            
            FeaturedItem()
            
            Color.clear.frame(height:1000)
        }
        .coordinateSpace(name: "scroll")
        .onPreferenceChange(ScrollerPreferenceKey.self, perform: { value in
            withAnimation(.easeInOut) {
                if value < 0 {
                    hasScrolled = true
                } else {
                    hasScrolled = false
                }
            }
        })
        
        .safeAreaInset(edge: .top, content: {
            Color.clear.frame(height: 70.0)
        })
        
        .overlay(
            NavigayionBar(navTitle: "Featured")
                .opacity(hasScrolled ? 1 : 0)
        )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewDevice("iPhone 13")
    }
}
