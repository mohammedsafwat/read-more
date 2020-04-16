//
//  UpdateDetail.swift
//  ReadMore
//
//  Created by Mohammed Abdullatif on 2020-04-14.
//  Copyright © 2020 Mohammed Abdullatif. All rights reserved.
//

import SwiftUI

struct UpdateDetail: View {
    let update: Update

    var body: some View {
        List {
            VStack {
                Image(update.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                Text(update.content)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .navigationBarTitle(update.title)
        }
        .listStyle(DefaultListStyle())
    }
}

struct UpdateDetail_Previews: PreviewProvider {
    static var previews: some View {
        UpdateDetail(update: UpdateStore().updates[0])
    }
}
