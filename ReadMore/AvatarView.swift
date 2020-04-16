//
//  AvatarView.swift
//  ReadMore
//
//  Created by Mohammed Abdullatif on 2020-04-14.
//  Copyright © 2020 Mohammed Abdullatif. All rights reserved.
//

import Foundation
import SwiftUI

struct AvatarView: View {
    @Binding var showProfile: Bool
    let size: CGSize

    var body: some View {
        Button(action: { self.showProfile.toggle() }) {
            Image("Avatar")
                .renderingMode(.original)
                .resizable()
                .frame(width: self.size.width, height: self.size.height)
                .clipShape(Circle())
                .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
        }
    }
}
