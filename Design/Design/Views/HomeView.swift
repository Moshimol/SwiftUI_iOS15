//
//  HomeView.swift
//  Design
//
//  Created by lushitong on 2022/4/18.
//

import SwiftUI

struct HomeView: View {
    @State var hasScrolled = false
    
    @Namespace var namespace
    @State var show = false
    @State var showStatusBar = true
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            ScrollView {
                scrollerDetection
                featured
                
                Text("Course".uppercased())
                    .font(.footnote.weight(.semibold))
                    .frame(maxWidth:.infinity, alignment: .topLeading)
                    .padding(.horizontal, 20)
                
                if !show {
                    CourseItem(namespace: namespace, show: $show)
                        .onTapGesture {
                            withAnimation(.openCard) {
                                show.toggle()
                                showStatusBar = false
                            }
                        }
                }
            }
            .coordinateSpace(name: "scroll")
        
            .safeAreaInset(edge: .top, content: {
                Color.clear.frame(height: 70.0)
            })
        
            .overlay(
                NavigayionBar(navTitle: "Featured", hasScrolled: $hasScrolled)
            )
            
            if show {
                CourseView(namespace: namespace, show: $show)
            }
        }
        .statusBar(hidden: !showStatusBar)
        .onChange(of: show) { newValue in
            withAnimation(.closeCard) {
                if newValue {
                    showStatusBar =  false
                } else {
                    showStatusBar = true
                }
            }
        }
    }
    
    var scrollerDetection: some View {
        GeometryReader { proxy in
            Color.clear.preference(key: ScrollerPreferenceKey.self, value: proxy.frame(in: .named("scroll")).minY)
        }
        .frame(height: 0)
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
    }
    
    var featured: some View {
        TabView {
            ForEach(courses) { course in
                GeometryReader { proxy in
                    let minX = proxy.frame(in: .global).minX
                    
                    FeaturedItem(course: course)
                        .padding(.vertical, 40)
                        .rotation3DEffect(.degrees(minX / -10), axis: (x: 0, y: 1, z: 0))
                        .shadow(color: Color("Shadow").opacity(0.3), radius: 10, x: 0, y: 10)
                        .blur(radius: abs(minX / 40))
                        .overlay(
                            Image(course.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 230)
                                .offset(x: 32, y: -80)
                                .offset(x: minX / 2)
                        )
                }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(height: 430)
        .background(
            Image("Blob 1")
                .offset(x: 250, y: -100)
        )
    }
    
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewDevice("iPhone 13")
    }
}
