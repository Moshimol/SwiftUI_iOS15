//
//  ContentView.swift
//  Design
//
//  Created by lushitong on 2022/4/17.
//

import SwiftUI

struct ContentView: View {
    /*
     文件分类的一般有5种
     1、Navigation
     2、Views
     3、Components
     4、Mode
     5、Styles
     
     */
    @AppStorage("selectTab") var selectTab: Tab = .home
    var body: some View {
        ZStack(alignment: .bottom) {
            Group {
                switch selectTab {
                    case .home:
                        HomeView()
                    case .explore:
                        AccountView()
                    case .notifications:
                        AccountView()
                    case .library:
                        AccountView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
           TabBar()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
            
    }
}
