//
//  Section.swift
//  ReadMore
//
//  Created by Mohammed Abdullatif on 2020-04-13.
//  Copyright © 2020 Mohammed Abdullatif. All rights reserved.
//

import Foundation
import SwiftUI

struct Section: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    var logo: String
    let image: Image
    let color: Color
}
