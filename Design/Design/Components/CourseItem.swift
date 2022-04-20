//
//  CourseItem.swift
//  Design
//
//  Created by lushitong on 2022/4/19.
//

import SwiftUI

struct CourseItem: View {
    var namespace:Namespace.ID
    var course:Course = courses[0]
    
    @Binding var show:Bool
    
    var body: some View {
        VStack {
            Spacer()
            VStack(alignment: .leading, spacing: 12) {
                Text(course.title)
                    .matchedGeometryEffect(id: "title\(course.id)", in: namespace)
                    .font(.largeTitle.weight(.bold))
                    .frame(maxWidth:.infinity , alignment: .leading)
                
                Text(course.subtitle.uppercased())
                    .font(.footnote.weight(.semibold))
                    .matchedGeometryEffect(id: "subtitle\(course.id)", in: namespace)
                
                Text(course.text)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.secondary)
                    .matchedGeometryEffect(id: "text\(course.id)", in: namespace)
                
            }
            .padding(20)
            .background(
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .mask(
                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                    )
                    .blur(radius: 30)
                    .matchedGeometryEffect(id: "blur", in: namespace)
                
            )
        }
        .foregroundStyle(.white)
        .background(
            Image(course.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .matchedGeometryEffect(id: "image\(course.id)", in: namespace)
        )
        .background(
            Image(course.background)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .matchedGeometryEffect(id: "background\(course.id)", in: namespace)
        )
        .mask(
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .matchedGeometryEffect(id: "mask\(course.id)", in: namespace)
        )
        .frame(height: 300)
        .padding(20)
    }
}

struct CourseItem_Previews: PreviewProvider {
    @Namespace static var namepace
    static var previews: some View {
        CourseItem(namespace: namepace,show: .constant(true))
    }
}
