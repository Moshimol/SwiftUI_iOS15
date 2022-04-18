//
//  FeaturedItem.swift
//  Design
//
//  Created by lushitong on 2022/4/18.
//

import SwiftUI

struct FeaturedItem: View {
    
    /*
     var title: String
     var subtitle: String
     var text: String
     var image: String
     var logo: String
     */
    
    var title: String
    var subtitle: String
    var text: String
    var image: String
    var logo: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8.0) {
            Spacer()
            Image(logo)
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .frame(width: 26.0, height: 26.0)
                .cornerRadius(20.0)
                .padding(9)
                .background(.ultraThinMaterial, in:RoundedRectangle(cornerRadius: 20, style:.continuous))
                .strokeStyle(cornerRadius: 16)
            
            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.linearGradient(colors: [.primary, .primary.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
                .lineLimit(1)
            
            Text(subtitle.uppercased())
                .font(.footnote)
                .fontWeight(.semibold)
                .foregroundColor(.secondary)
            
            Text(text)
                .font(.footnote)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.secondary)
        }
        .padding(.all, 20.0)
        .padding(.vertical, 20)
        .frame(height: 350.0)
        .background(.ultraThinMaterial, in:RoundedRectangle(cornerRadius: 30, style:.continuous))
        //        .cornerRadius(30)
        //        .mask(RoundedRectangle(cornerSize: 30, style:.continuous))
        
        //        .modifier(StorkeStyle())
        .strokeStyle()
        .padding(.horizontal, 20.0)
    }
}

struct FeaturedItem_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedItem(title: "1", subtitle: "1", text: "1", image: "1", logo: "1")
    }
}
