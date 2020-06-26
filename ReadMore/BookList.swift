//
//  BookList.swift
//  ReadMore
//
//  Created by Mohammed Abdullatif on 2020-06-26.
//  Copyright © 2020 Mohammed Abdullatif. All rights reserved.
//

import SwiftUI

struct BookList: View {
    var body: some View {
        VStack {
            BookView()
        }
    }
}

struct BookList_Previews: PreviewProvider {
    static var previews: some View {
        BookList()
    }
}

struct BookView: View {
    @State var show = false

    var body: some View {
        VStack {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Pro Swift")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.white)
                    Text("20 Chapters")
                        .foregroundColor(Color.white.opacity(0.7))
                }
                Spacer()
                Image(uiImage: #imageLiteral(resourceName: "Logo1"))
            }
            Spacer()
            Image(uiImage: #imageLiteral(resourceName: "Card4"))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .frame(height: 140, alignment: .top)
        }
        .padding(show ? 30 : 20)
        .padding(.top, show ? 30 : 0)
        .frame(maxWidth: show ? .infinity : screen.width - 60, maxHeight: show ? .infinity : 280)
        .background(Color(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)))
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(color: Color(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)).opacity(0.5), radius: 20, x: 0, y: 20)
        .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
        .onTapGesture {
            self.show.toggle()
        }
        .edgesIgnoringSafeArea(.all)
    }
}
