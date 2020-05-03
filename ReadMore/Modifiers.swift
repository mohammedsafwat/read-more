//
//  Modifiers.swift
//  ReadMore
//
//  Created by Mohammed Abdullatif on 2020-05-03.
//  Copyright © 2020 Mohammed Abdullatif. All rights reserved.
//

import SwiftUI

struct ShadowModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: Color.black.opacity(0.1), radius: 6, x: 0, y: 8)
            .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
    }
}

struct FontModifier: ViewModifier {
    var style: Font.TextStyle = .body
    
    func body(content: Content) -> some View {
        content
            .font(.system(style, design: .rounded))
    }
}

struct CustomFontModifier: ViewModifier {
    var size: CGFloat = 28

    func body(content: Content) -> some View {
        content.font(.custom("WorkSans-Bold", size: size))
    }
}
