//
//  HomeUIView.swift
//  app920
//
//  Created by Dias Atudinov on 10.09.2024.
//

import SwiftUI

struct HomeUIView: View {
    @Binding var tabNum: Int
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
                
                if !true {
                    VStack(spacing: 10) {
                        Image("emptyLogo")
                            .padding(.bottom, 10)
                        Spacer()
                        Button {
                            tabNum = 1
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
                    HStack {
                        Text("Planned attractions")
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .bold))
                        Spacer()
                        Button {
                            tabNum = 1
                        } label: {
                            HStack(spacing: 2) {
                                Text("Look all")
                                    .font(.system(size: 15))
                                Image(systemName: "chevron.right")
                            }.foregroundColor(.redBtn)
                        }
                    }
                    
                    ScrollView {
                        AttractionCellUIView()
                        AttractionCellUIView()
                        AttractionCellUIView()
                        AttractionCellUIView()
                        AttractionCellUIView()
                    }
                    Spacer()
                    Button {
                        tabNum = 1
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
                }
                
                
            }.padding(.horizontal).padding(.bottom, 80)
        }
    }
}

#Preview {
    HomeUIView(tabNum: .constant(0))
}
