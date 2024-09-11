//
//  AttractionDetailsUIView.swift
//  app920
//
//  Created by Dias Atudinov on 11.09.2024.
//

import SwiftUI

struct AttractionDetailsUIView: View {
    @State var attraction: Attraction
    @ObservedObject var viewModel: AttractionViewModel
    var body: some View {
        ZStack {
            Color.mainBg.ignoresSafeArea()
            VStack(spacing: 20) {
                
                if let image = attraction.image {
                    Image(uiImage: image)
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width - 32 , height: 220)
                        .cornerRadius(12)
                } else {
                    Image("firstScreen920")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width - 32 , height: 220)
                        .cornerRadius(12)
                }
                
                HStack {
                    VStack(alignment: .leading) {
                        Text(attraction.name)
                            .font(.system(size: 17, weight: .semibold))
                        Text("\(attraction.country), \(attraction.city)")
                            .font(.system(size: 15))
                    }.foregroundColor(.white)
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text("\(attraction.cost)")
                            .font(.system(size: 16, weight: .semibold))
                       Image(systemName: "camera.fill")
                            .foregroundColor(.white.opacity(0.5))
                    }.foregroundColor(.white)
                }
                
                HStack {
                    Text(attraction.excursion).foregroundColor(.red)
                        .font(.system(size: 15))
                        .padding(5).padding(.vertical, 6)
                        .overlay(
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(.red , lineWidth: 1)
                        )
                    Spacer()
                }
                
                Text(attraction.description).foregroundColor(.white)
                    .font(.system(size: 15))
                    .frame(maxWidth: .infinity)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(.red , lineWidth: 1)
                    )
                
                Spacer()
                
                HStack(spacing: 12) {
                    
                    NavigationLink {
                        EditAttractionUIView(viewModel: viewModel, attraction: attraction)
                    } label: {
                        ZStack {
                            Rectangle()
                                .frame(height: 50)
                                .cornerRadius(16)
                                .foregroundColor(.redBtn)
                            Text("Edit")
                                .font(.system(size: 15))
                                .foregroundColor(.white)
                        }
                    }
                    
                    Button {
                        viewModel.deleteAttraction(for: attraction)
                    } label: {
                        ZStack {
                            Rectangle()
                                .frame(height: 48)
                                .foregroundColor(.mainBg)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(.red , lineWidth: 2)
                                )
                            Text("Delete")
                                .font(.system(size: 15))
                                .foregroundColor(.white)
                        }
                    }
                    
                }
            }.padding(.horizontal)
            .navigationTitle(attraction.name)
        }
    }
}

#Preview {
    AttractionDetailsUIView(attraction: Attraction(name: "Louvre", country: "France", city: "Paris", cost: "30 $", description: "A palace with a large collection of works of art: from Roman sculptures to Leonardo da Vinci's Mona Lisa. A palace with a large collection of works of art: from Roman sculptures to Leonardo da Vinci's Mona Lisa A palace with a large collection of works of art: from Roman sculptures to Leonardo da Vinci's Mona Lisa", excursion: "Historical"), viewModel: AttractionViewModel())
}
