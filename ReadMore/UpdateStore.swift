//
//  UpdateStore.swift
//  ReadMore
//
//  Created by Mohammed Abdullatif on 2020-04-15.
//  Copyright © 2020 Mohammed Abdullatif. All rights reserved.
//

import SwiftUI
import Combine

class UpdateStore: ObservableObject {
    @Published var updates: [Update] = [
        Update(image: "Card1", title: "SwiftUI 1", content: "Text 1", date: "Jan 1"),
        Update(image: "Card2", title: "SwiftUI 2", content: "Text 2", date: "Feb 20")
    ]
}
