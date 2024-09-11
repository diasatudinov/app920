//
//  AttractionsUIView.swift
//  app920
//
//  Created by Dias Atudinov on 10.09.2024.
//

import SwiftUI

struct AttractionsUIView: View {
    
    @ObservedObject var viewModel: AttractionViewModel
    @ObservedObject var settingsVM: SettingsViewModel
    let filters = ["All", "Historical", "Сultural", "Natural", "Architectural"]
    @State var selectedFilter: String?
    let columns = [
            GridItem(.flexible()), // First column
            GridItem(.flexible())  // Second column
        ]
    
    var filteredItems: [Attraction] {
            if selectedFilter == nil || selectedFilter == "All" {
                return viewModel.attractions
            } else {
                return viewModel.attractions.filter { $0.excursion.lowercased().contains(selectedFilter?.lowercased() ?? "All") }
            }
        }
    
    var body: some View {
        ZStack {
            Color.mainBg.ignoresSafeArea()
            VStack {
                HStack {
                    ZStack {
                        if let image = settingsVM.account.image {
                            Image(uiImage: image)
                                .resizable()
                                .frame(width: 56, height: 56)
                                .scaledToFill()
                                .clipShape(Circle())
                        }  else {
                            Image(systemName: "person.fill")
                                .font(.system(size: 32))
                                .foregroundColor(.red)
                                .padding(.top)
                                .background(Color.white.opacity(0.5)).clipShape(Circle())
                                .padding(9)
                                .overlay(
                                    Circle()
                                        .stroke(Color.white.opacity(0.5), lineWidth: 1)
                                )
                        }
                    }
                    
                    Text("Welcome \(settingsVM.account.name)!")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                    Spacer()
                }
                if viewModel.attractions.isEmpty {
                    VStack(spacing: 10) {
                        Image("emptyLogo")
                            .padding(.bottom, 10)
                        Spacer()
                        NavigationLink {
                            NewAttractionUIView(viewModel: viewModel)
                        } label: {
                            ZStack {
                                Rectangle()
                                    .frame(height: 50)
                                    .cornerRadius(16)
                                    .foregroundColor(.redBtn)
                                Text("Add point of interest")
                                    .font(.system(size: 15))
                                    .foregroundColor(.white)
                            }
                        }
                    }.padding(.top, 50)
                } else {
                    VStack {
                       
                        
                        
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(Range(0...filters.count - 1)) { index in
                                    Text(filters[index])
                                        .font(.system(size: 13))
                                        .padding(12)
                                        .foregroundColor(selectedFilter == filters[index] ? .redBtn : .white.opacity(0.5))
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 6)
                                                .stroke(selectedFilter == filters[index] ? .redBtn : .white.opacity(0.5), lineWidth: 1)
                                        )
                                        .onTapGesture {
                                            selectedFilter = filters[index]
                                        }
                                }
                            }.padding(2)
                        }
                        
                        ScrollView {
                            LazyVGrid(columns: columns, spacing: 20) {
                                ForEach(filteredItems, id: \.self) { attraction in
                                    NavigationLink {
                                        AttractionDetailsUIView(attraction: attraction, viewModel: viewModel)
                                    } label: {
                                        AttractionCellSmallUIView(attraction: attraction)
                                    }
                                }
                            }
                            
                        }
                        
                        
                    }
                    
                    
                }
                
                Spacer()
            }.padding(.horizontal).padding(.bottom, 40)
            
            if !viewModel.attractions.isEmpty {
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        
                        NavigationLink {
                            NewAttractionUIView(viewModel: viewModel)
                            
                        } label: {
                            ZStack {
                                Rectangle()
                                    .frame(width: 58, height: 58)
                                    .cornerRadius(12)
                                    .foregroundColor(.redBtn)
                                Image(systemName: "plus")
                                    .foregroundColor(.white)
                                    .font(.system(size: 25, weight: .semibold))
                            }
                        }
                        
                    }
                }.padding(.horizontal).padding(.bottom, 80)
            }
        }
    }
}

#Preview {
    AttractionsUIView(viewModel: AttractionViewModel(), settingsVM: SettingsViewModel())
}

