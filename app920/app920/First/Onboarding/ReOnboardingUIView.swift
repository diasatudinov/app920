//
//  ReOnboardingUIView.swift
//  app920
//
//  Created by Dias Atudinov on 10.09.2024.
//

import SwiftUI

struct ReOnboardingUIView: View {
    @State private var pageNum: Int = 1
    @State private var showSheet = false
    @AppStorage("signedUP") var signedUP: Bool = false
    
    var body: some View {
        if !signedUP {
            ZStack {
                Color.mainBg
                    .ignoresSafeArea()
                VStack(spacing: 0) {
                    
                    switch pageNum {
                    case 1: Image("app920Screen1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 530)
                            .padding(.top)
                            
                    case 2: Image("app920Screen2")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 530)
                            .padding(.top)
                    default:
                        Image("appScreen3")
                            .resizable()
                            .frame(height: 549)
                            .ignoresSafeArea()
                    }
                    
                    ZStack {
                        Rectangle()
                            .foregroundColor(.secondBg)
                        
                        VStack {
                            switch pageNum {
                            case 1:
                                VStack(spacing: 12) {
                                    Text("Intuitive interface")
                                        .font(.title)
                                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                        .multilineTextAlignment(.center)
                                    Text("To improve attraction planning.")
                                        .font(.system(size: 15))
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(.gray.opacity(0.7))
                                }.frame(height: 100).padding(.bottom, 10).padding(.horizontal, 30).foregroundColor(.white).padding(.top, 24)
                            case 2:
                                VStack(spacing: 12) {
                                    Text("Organize your must-see attractions")
                                        .font(.title)
                                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                        .multilineTextAlignment(.center)
                                    Text("And keep track of where you've been.")
                                        .font(.system(size: 15))
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(.gray.opacity(0.7))
                                }.frame(height: 100).padding(.bottom, 10).padding(.horizontal, 30).foregroundColor(.white).padding(.top, 24)
                            default:
                                Text("Save information about \nyour favorite routes")
                                    .font(.title)
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    .frame(height: 70)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                                    .padding(.bottom, 10)
                                
                            }
                            
                            Button {
                                if pageNum < 2 {
                                    pageNum += 1
                                } else {
                                    signedUP = true
                                }
                            } label: {
                                Text("Next")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 15))
                                    .padding()
                                    .frame(maxWidth: .infinity)
                            }.frame(height: 50).background(Color.redBtn)
                                .cornerRadius(16).padding(.horizontal)
                            
                            HStack(spacing: 8) {
                                Circle()
                                    .fill(pageNum == 1 ? Color.redBtn : Color.redBtn.opacity(0.5))
                                    .frame(width: 8, height: 8)
                                    .cornerRadius(19)
                                
                                Circle()
                                    .fill(pageNum == 2 ? Color.redBtn : Color.redBtn.opacity(0.5))
                                    .frame(width: 8, height: 8)
                                    .cornerRadius(19)
                                
                            }
                            .padding()
                            Spacer()
                        }
                        
                    }
                    
                    
                }.edgesIgnoringSafeArea(.bottom)
            }
            
        } else {
            TabUIView()
        }
    }
}

#Preview {
    ReOnboardingUIView()
}
