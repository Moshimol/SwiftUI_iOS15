//
//  TabBar.swift
//  Design
//
//  Created by lushitong on 2022/4/17.
//

import SwiftUI

struct TabBar: View {
    @State var selectTab: Tab = .home
    @State var color: Color  = .teal
    @State var tabItemWidth: CGFloat = 0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            Group {
                switch selectTab {
                    case .home:
                        ContentView()
                    case .explore:
                        AccountView()
                    case .notifications:
                        AccountView()
                    case .library:
                        AccountView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            HStack {
                buttons
            }
            .padding(.horizontal, 8)
            .padding(.top, 14)
            .frame(height: 88, alignment: .top)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 34, style: .continuous))
            .background(
                backGround
            )
            .overlay (
                overlay
            )
            .strokeStyle(cornerRadius: 34)
            .frame(maxHeight: .infinity, alignment: .bottom)
            .ignoresSafeArea()
        }
    }
    
    var buttons: some View {
        ForEach(tabItems) { item in
            Button {
                withAnimation (.spring(response:0.3,dampingFraction: 0.7)){
                    selectTab = item.tab
                    color = item.color
                }
            } label: {
                VStack (spacing:0){
                    Image(systemName: item.icon)
                        .symbolVariant(.fill)
                        .font(.body.bold())
                        .frame(width: 44, height: 29)
                    
                    Text(item.text)
                        .font(.caption2)
                        .lineLimit(1)
                }
                .frame(maxWidth:.infinity)
            }
            .foregroundStyle(selectTab == item.tab ? .primary :.secondary)
            .blendMode(selectTab == item.tab ? .overlay : .normal)
            .overlay(
                GeometryReader { proxy in
                    Color.clear.preference(key: TabPreferenceKey.self, value: proxy.size.width)
                }
            )
            .onPreferenceChange(TabPreferenceKey.self) { value in
                tabItemWidth = value
            }
        }
    }
    
    var backGround: some View {
        HStack {
            if selectTab == .library {Spacer()}
            if selectTab == .explore {Spacer()}
            if selectTab == .notifications {
                Spacer()
                Spacer()
            }
            Circle().fill(color).frame(width:tabItemWidth)
            if selectTab == .home {Spacer()}
            if selectTab == .explore  {
                Spacer()
                Spacer()
            }
            if selectTab == .notifications {Spacer()}
        }
        .padding(.horizontal, 8.0)
    }
    
    var overlay: some View {
        HStack {
            if selectTab == .library {Spacer()}
            if selectTab == .explore {Spacer()}
            if selectTab == .notifications {
                Spacer()
                Spacer()
            }
            Rectangle()
                .fill(color)
                .frame(width: 28, height: 5)
                .cornerRadius(3)
                .frame(width:tabItemWidth)
                .frame(maxHeight: .infinity, alignment: .top)
            if selectTab == .home {Spacer()}
            if selectTab == .explore  {
                Spacer()
                Spacer()
            }
            if selectTab == .notifications {Spacer()}
        }
        .padding(.horizontal, 8.0)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
            .previewDevice("iPhone 13")
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
