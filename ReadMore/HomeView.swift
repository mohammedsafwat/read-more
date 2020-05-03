//
//  HomeView.swift
//  ReadMore
//
//  Created by Mohammed Abdullatif on 2020-04-13.
//  Copyright © 2020 Mohammed Abdullatif. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @Binding var showProfile: Bool
    @State var showUpdate = false
    @Binding var showContent: Bool

    let sectionsData = [
        Section(title: "The Pragmatic Programmer", subtitle: "20 Chapters", logo: "Logo4", image: Image("Card4"), color: Color("card7")),
        Section(title: "Minimalizm", subtitle: "25 Chapters", logo: "Logo4", image: Image("Card5"), color: Color("card2")),
        Section(title: "UX Basics", subtitle: "25 Chapters", logo: "Logo4", image: Image("Card6"), color: Color("card3"))
    ]

    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text("Home")
                        .modifier(CustomFontModifier(size: 28))

                    Spacer()

                    AvatarView(showProfile: $showProfile, size: CGSize(width: 36, height: 36))
                    
                    Button(action: { self.showUpdate.toggle() }) {
                        Image(systemName: "bell")
                            .renderingMode(.original)
                            .font(.system(size: 16, weight: .medium))
                            .frame(width: 36, height: 36)
                            .background(Color.white)
                            .clipShape(Circle())
                            .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
                    }
                    .sheet(isPresented: $showUpdate) {
                        UpdatesList()
                    }
                }
                .padding(EdgeInsets(top: 30, leading: 30, bottom: 0, trailing: 30))

                ScrollView(.horizontal, showsIndicators: false) {
                    WatchRingsView()
                        .padding(.horizontal, 30)
                        .padding(.bottom, 20)
                        .onTapGesture {
                            self.showContent = true
                    }
                }

                HStack {
                    Text("New Books")
                        .font(.title).bold()
                    Spacer()
                }
                .padding(.leading, 30)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(sectionsData) { section in
                            GeometryReader { geometry in
                                SectionView(section: section)
                                    .rotation3DEffect(
                                        .degrees(Double(geometry.frame(in: .global).minX - 30) / -20.0),
                                        axis: (x: 0, y: 10.0, z: 0)
                                )
                            }
                            .frame(width: 275, height: 275)
                        }
                    }
                    .padding(EdgeInsets(top: 30, leading: 30, bottom: 60, trailing: 30))
                }
                .offset(y: -30)

                HStack {
                    Text("Recently Read")
                        .font(.title).bold()
                    Spacer()
                }
                .padding(.leading, 30)
                .offset(y: -60)

                SectionView(section: sectionsData[2], width: screen.width - 60, height: 275)
                    .offset(y: -60)

                Spacer()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showProfile: .constant(false), showContent: .constant(false))
    }
}

struct SectionView: View {
    let section: Section
    var width: CGFloat = 275
    var height: CGFloat = 275

    var body: some View {
        VStack {
            VStack(spacing: 0) {
                HStack(alignment: .top) {
                    Text(section.title)
                        .font(.system(size: 22, weight: .bold))
                        .frame(width: 160, alignment: .leading)
                        .foregroundColor(.white)

                    Spacer()

                    Image(section.logo)
                        .resizable()
                        .frame(width: 30, height: 30)
                }

                Text(section.subtitle.uppercased()).frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
            }

            section.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 210)
        }
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .frame(width: width, height: height)
        .background(section.color)
        .cornerRadius(30)
        .shadow(color: section.color.opacity(0.7), radius: 20, x: -10, y: 10)
    }
}

struct WatchRingsView: View {
    var body: some View {
        HStack(spacing: 20) {
            HStack(spacing: 12) {
                RingView(color1: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)), color2: Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)), width: 44, height: 44, percent: 68, show: .constant(true))
                VStack(alignment: .leading, spacing: 4) {
                    Text("60 pages left").bold().modifier(FontModifier(style: .subheadline))
                    Text("Read 10 minutes today").modifier(FontModifier(style: .caption))
                }
            }
            .padding(8)
            .background(Color.white)
            .cornerRadius(20)
            .modifier(ShadowModifier())

            HStack(spacing: 12) {
                RingView(color1: Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)), color2: Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)), width: 32, height: 32, percent: 40, show: .constant(true))
            }
            .padding(8)
            .background(Color.white)
            .cornerRadius(20)
            .modifier(ShadowModifier())

            HStack(spacing: 12) {
                RingView(color1: Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)), color2: Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)), width: 32, height: 32, percent: 40, show: .constant(true))
            }
            .padding(8)
            .background(Color.white)
            .cornerRadius(20)
            .modifier(ShadowModifier())
        }
    }
}
