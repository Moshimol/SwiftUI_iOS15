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
    @State var selectedID = UUID()
    @EnvironmentObject var model: Model
    
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
                    cards
                } else {
                    ForEach(courses) { course in
                        Rectangle()
                            .fill(.white)
                            .frame(height:300)
                            .cornerRadius(30)
                            .shadow(color: Color("Shadow"), radius: 20, x: 0, y: 10)
                            .opacity(0.3)
                        .padding(.horizontal, 30)
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
                details
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
            ForEach(featuredCourses) { course in
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
    
    
    var cards: some View {
        ForEach(courses) { course in
            CourseItem(namespace: namespace,course: course, show: $show)
                .onTapGesture {
                    withAnimation(.openCard) {
                        show.toggle()
                        model.showDetails.toggle()
                        showStatusBar = false
                        selectedID = course.id
                    }
            }
        }
    }
    
    
    var details: some View {
        ForEach(courses) { course in
            if course.id == selectedID {
                CourseView(namespace: namespace, show: $show, course: course)
                    .zIndex(1)
//                    .transition(.opacity.animation(.easeOut(duration: 0.1)))
                .transition(.asymmetric(insertion: .opacity.animation(.easeOut(duration: 0.1)), removal: .opacity.animation(.easeOut(duration: 0.3).delay(0.2))))
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewDevice("iPhone 13")
            .environmentObject(Model())
    }
}
