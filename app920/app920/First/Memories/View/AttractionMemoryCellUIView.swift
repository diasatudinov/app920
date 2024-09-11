//
//  AttractionMemoryCellUIView.swift
//  app920
//
//  Created by Dias Atudinov on 11.09.2024.
//

import SwiftUI

struct AttractionMemoryCellUIView: View {
    @State var images: [UIImage?] = []
    @State var attraction: Attraction
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    @State var count = 0
    var body: some View {
        ZStack {
            Color.black
            VStack {
                LazyVGrid(columns: columns, spacing: 10) {
                    // Take only the first 4 images from the array
                    ForEach(0..<min(4, images.count), id: \.self) { index in
                        if let image = images[index] {
                             // If image exists
                                Image(uiImage: image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(height: 108)
                                    .clipped()
                            }
                    }
                    
                    if images.count < 4 {
                        Rectangle()
                            .fill(Color.gray)
                            .frame(height: 108)
                    }
                    
                    if images.count < 3 {
                        Rectangle()
                            .fill(Color.gray)
                            .frame(height: 108)
                    }
                    
                    if images.count < 2 {
                        Rectangle()
                            .fill(Color.gray)
                            .frame(height: 108)
                    }
                    if images.count < 1 {
                        Rectangle()
                            .fill(Color.gray)
                            .frame(height: 108)
                    }
                    
                    
                    
                }.cornerRadius(2)
//                if let image = attraction.image {
//                    Image(uiImage: image)
//                        .resizable()
//                        .frame(width: UIScreen.main.bounds.width - 32 , height: 130)
//                } else {
//                    Image("firstScreen920")
//                        .resizable()
//                        .frame(width: UIScreen.main.bounds.width - 32, height: 130)
//                }
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
        }.frame(height: 299).cornerRadius(10)
            .onAppear() {
                images = attraction.firstFourImages()
            }
    }
}

#Preview {
    AttractionMemoryCellUIView(attraction: Attraction(name: "fsfsf", country: "sfsdfsdf", city: "sdfdsf", cost: "33", description: "zxcczc", excursion: "xzcxzczx", memories: []))
}
