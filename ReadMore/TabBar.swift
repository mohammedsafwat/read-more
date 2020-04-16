//
//  TabBar.swift
//  ReadMore
//
//  Created by Mohammed Abdullatif on 2020-04-15.
//  Copyright © 2020 Mohammed Abdullatif. All rights reserved.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            Home().tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }
            ContentView().tabItem {
                Image(systemName: "rectangle.stack.fill")
                Text("Passes")
            }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabBar().previewDevice("iPhone 11")
            TabBar().previewDevice("iPhone 8")
        }
    }
}
