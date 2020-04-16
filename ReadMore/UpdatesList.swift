//
//  UpdatesList.swift
//  ReadMore
//
//  Created by Mohammed Abdullatif on 2020-04-14.
//  Copyright © 2020 Mohammed Abdullatif. All rights reserved.
//

import SwiftUI

struct UpdatesList: View {
    @ObservedObject var store = UpdateStore()

    func addUpdate() {
        store.updates.append(Update(image: "Card1", title: "New Item", content: "text", date: "Jan 1"))
    }

    var body: some View {
        NavigationView {
            List {
                ForEach(store.updates) { update in
                    NavigationLink(destination: UpdateDetail(update: update)) {
                        HStack {
                            Image(update.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80, height: 80)
                                .background(Color.black)
                                .cornerRadius(20)
                                .padding(.trailing, 4)

                            VStack(alignment: .leading, spacing: 8) {
                                Text(update.title)
                                    .font(.system(size: 20, weight: .bold))

                                Text(update.content)
                                    .lineLimit(2)
                                    .font(.subheadline)
                                    .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))

                                Text(update.date)
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.vertical, 8)
                    }
                }
                .onDelete { indexSet in
                    guard let index = indexSet.first else { return }
                    self.store.updates.remove(at: index)
                }
                .onMove { (indexSet, index) in
                    self.store.updates.move(fromOffsets: indexSet, toOffset: index)
                }
            }
            .navigationBarTitle(Text("Updates"))
            .navigationBarItems(leading: Button(action: addUpdate) {
                Text("Add Update")
            }, trailing: EditButton())
        }
    }
}

struct UpdatesList_Previews: PreviewProvider {
    static var previews: some View {
        UpdatesList()
    }
}
