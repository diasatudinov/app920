//
//  AttractionCellUIView.swift
//  app920
//
//  Created by Dias Atudinov on 10.09.2024.
//

import SwiftUI

struct AttractionCellUIView: View {
    @State var attraction: Attraction
    var body: some View {
        ZStack {
            Color.black
            VStack {
                if let image = attraction.image {
                    Image(uiImage: image)
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width - 32 , height: 130)
                } else {
                    Image("firstScreen920")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width - 32, height: 130)
                }
                HStack {
                    VStack(alignment: .leading) {
                        Text(attraction.name)
                            .font(.system(size: 17, weight: .semibold))
                        Text("\(attraction.country), \(attraction.city)")
                            .font(.system(size: 15))
                    }.foregroundColor(.white).padding(.bottom)
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text("\(attraction.cost) $")
                            .font(.system(size: 16, weight: .semibold))
                        Text(attraction.excursion).foregroundColor(.red)
                            .font(.system(size: 15))
                            .italic()
                    }.foregroundColor(.white).padding(.bottom)
                }.frame(maxHeight: .infinity).padding(.horizontal)
            }
        }.frame(height: 186).cornerRadius(10)
    }
}

#Preview {
    AttractionCellUIView(attraction: Attraction(name: "fsfsf", country: "sfsdfsdf", city: "sdfdsf", cost: "33", description: "zxcczc", excursion: "xzcxzczx"))
}

struct AttractionCellSmallUIView: View {
    @State var attraction: Attraction
    var body: some View {
        ZStack {
            Color.black
            VStack {
                if let image = attraction.image {
                    Image(uiImage: image)
                        .resizable()
                        .frame(height: 123)
                } else {
                    Image("firstScreen920")
                        .resizable()
                        .frame(height: 123)
                }
                HStack {
                    VStack(alignment: .leading) {
                        Text(attraction.name)
                            .font(.system(size: 17, weight: .semibold))
                        Text("\(attraction.country), \(attraction.city)")
                            .font(.system(size: 15))
                    }.foregroundColor(.white).padding(.bottom)
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text("\(attraction.cost) $")
                            .font(.system(size: 16, weight: .semibold))
                        Text(attraction.excursion).foregroundColor(.red)
                            .font(.system(size: 15))
                            .italic()
                    }.foregroundColor(.white).padding(.bottom)
                }.frame(maxHeight: .infinity).padding(.horizontal, 12)
            }
        }.frame(height: 198).cornerRadius(10)
    }
}
