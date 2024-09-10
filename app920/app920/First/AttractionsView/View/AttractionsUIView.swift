//
//  AttractionsUIView.swift
//  app920
//
//  Created by Dias Atudinov on 10.09.2024.
//

import SwiftUI

struct AttractionsUIView: View {
    let filters = ["All", "Historical", "Сultural", "Natural", "Architectural"]
    @State var selectedFilter: String?
    var body: some View {
        ZStack {
            Color.mainBg.ignoresSafeArea()
            VStack {
                HStack {
                    ZStack {
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
                    
                    Text("Welcome Nina!")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                    Spacer()
                }
                if true {
                    VStack(spacing: 10) {
                        Image("emptyLogo")
                            .padding(.bottom, 10)
                        Spacer()
                        Button {
                            
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
                        
                        Spacer()
                    }
                    
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            
                            Button {
                                
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
                    }
                }
                
                Spacer()
            }.padding(.horizontal).padding(.bottom, 80)
        }
    }
}

#Preview {
    AttractionsUIView()
}
