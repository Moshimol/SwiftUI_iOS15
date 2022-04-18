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
                TabView {
                    ForEach(courses) { item in
                        GeometryReader { proxy in
                            let minx = proxy.frame(in: .global).minX
                            FeaturedItem(title: item.title, subtitle: item.subtitle, text: item.subtitle, image: item.image, logo: item.logo)
                                .padding(.vertical, 40)
                                .rotation3DEffect(.degrees(minx / -10), axis: (x: 0, y: 1, z: 0))
                                .shadow(color: Color("Shadow").opacity(0.3), radius: 10, x: 0, y: 10)
                                .blur(radius: abs(minx / 40))
                                .overlay(
                                    Image(item.image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(height: 230)
                                        .offset(x: 32, y: -80)
                                        .offset(x: minx / 2)
                                )
                        }
                    }
                }
                .background(
                    GeometryReader { proxy in
                        Text("\(proxy.frame(in: .named("scroll")).minY)")
                        Color.clear.preference(key: ScrollerPreferenceKey.self, value: proxy.frame(in: .named("scroll")).minY)
                    }
                )
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
                print("=====\(value)")
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
