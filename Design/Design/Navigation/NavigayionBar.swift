//
//  SwiftUIView.swift
//  Design
//
//  Created by lushitong on 2022/4/18.
//

import SwiftUI

struct NavigayionBar: View {
    var navTitle = ""
    @Binding var hasScrolled:Bool
    
    var body: some View {
        ZStack {
            Color.clear
                .background(.ultraThinMaterial)
                .blur(radius: 10)
                .opacity(hasScrolled ? 1 : 0)
            
            Text(navTitle)
                .animatableFont(size: hasScrolled ? 22 : 34, weight: .bold)
                .frame(maxWidth:.infinity, maxHeight: .infinity, alignment: .leading)
                .padding(.leading, 20)
                .padding(.top, 20)
                .offset(y:hasScrolled ? -4 : 0)
            
            HStack (spacing: 16){
                Image(systemName: "magnifyingglass")
                    .font(.body.weight(.bold))
                    .frame(width: 36, height: 36)
                    .foregroundStyle(.secondary)
                    .background(.ultraThinMaterial, in : RoundedRectangle(cornerRadius: 14.0, style: .continuous))
                .strokeStyle(cornerRadius: 14)
                
                Image("Avatar Default")
                    .resizable()
                    .frame(width: 26, height: 26)
                    .cornerRadius(10)
                    .padding(8)
                    .background(.ultraThinMaterial, in : RoundedRectangle(cornerRadius: 18.0, style: .continuous))
                .strokeStyle(cornerRadius: 18)
            }
            .frame(maxWidth:.infinity, alignment: .trailing)
            .padding(.trailing, 20)
            .padding(.top, 20)
            .offset(y:hasScrolled ? -4 : 0)
        }
        .frame(height: hasScrolled ? 44 : 70)
        .frame(maxWidth:.infinity, maxHeight: .infinity, alignment: .top)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        NavigayionBar(navTitle: "title", hasScrolled: .constant(false))
            .previewDevice("iPhone 13")
    }
}
