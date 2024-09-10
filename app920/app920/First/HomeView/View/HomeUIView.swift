//
//  HomeUIView.swift
//  app920
//
//  Created by Dias Atudinov on 10.09.2024.
//

import SwiftUI

struct HomeUIView: View {
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
                        
                        Text("The list is empty")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.white)
                        Text("Add new points of interest by clicking \non the button")
                            .multilineTextAlignment(.center)
                            .font(.system(size: 15))
                            .foregroundColor(.white)
                            .padding(.bottom, 10)
                        
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
                    
                }
                
                Spacer()
            }.padding(.horizontal)
        }
    }
}

#Preview {
    HomeUIView()
}
