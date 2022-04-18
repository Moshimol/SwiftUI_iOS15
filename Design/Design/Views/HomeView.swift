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
        ZStack {
            Color("Background").ignoresSafeArea()
            ScrollView {
                GeometryReader { proxy in
                    Color.clear.preference(key: ScrollerPreferenceKey.self, value: proxy.frame(in: .named("scroll")).minY)
                }
                .frame(height: 0)
                TabView {
                    ForEach(courses) { item in
                        FeaturedItem(title: item.title, subtitle: item.subtitle, text: item.subtitle, image: item.image, logo: item.logo)
                            .padding(.vertical, 40)
                    }
                }
                .background(
                    Image("Blob 1")
                        .offset(x: 250, y: -100)
                )
                .tabViewStyle(.page(indexDisplayMode: .never))
                .background(
                    Image("Blob 1")
                        .offset(x: 250, y: -100)
                )
                .frame(height: 430)
                
                
                Color.clear.frame(height:1000)
            }
            .coordinateSpace(name: "scroll")
            .onPreferenceChange(ScrollerPreferenceKey.self, perform: { value in
                print("123\(value)")
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
                NavigayionBar(navTitle: "Featured", hasScrolled: $hasScrolled)
                    
        )
        }
    }
    
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewDevice("iPhone 13")
    }
}
