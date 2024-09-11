//
//  SettingsUIView.swift
//  app920
//
//  Created by Dias Atudinov on 11.09.2024.
//

import SwiftUI

struct SettingsUIView: View {
    @ObservedObject var viewModel: SettingsViewModel
    
    var body: some View {
        ZStack {
            Color.mainBg.ignoresSafeArea()
            VStack(spacing: 0) {
                HStack {
                    Text("Settings")
                        .font(.system(size: 17))
                        .bold()
                        .foregroundColor(.white)
                    
                }.padding(.top, 16)
                    .padding(.bottom, 29)
                
                
                ScrollView {
                    VStack(spacing: 14) {
                        
                        
                        ZStack {
                            Rectangle()
                                .cornerRadius(12)
                                .foregroundColor(.black)
                            HStack {
                                NavigationLink {
                                    AccountUIView(account: viewModel.account, viewModel: viewModel)
                                } label: {
                                    HStack {
                                        
                                        Image(systemName: "person.fill")
                                            .foregroundColor(.white)
                                            .font(.system(size: 28))
                                        
                                        Text("Accaunt")
                                            .foregroundColor(.white)
                                            .font(.system(size: 17, weight: .bold))
                                        Spacer()
                                        
                                    }.padding(20)
                                }
                            }
                        }
                        
                        ZStack {
                            Rectangle()
                                .cornerRadius(12)
                                .foregroundColor(.black)
                            HStack {
                                Button {
                                    viewModel.shareApp()
                                } label: {
                                    HStack {
                                        
                                        Image(systemName: "square.and.arrow.up.fill")
                                            .foregroundColor(.white)
                                            .font(.system(size: 28))
                                        
                                        Text("Share App")
                                            .foregroundColor(.white)
                                            .font(.system(size: 17, weight: .bold))
                                        Spacer()
                                        ZStack {
                                            Rectangle()
                                                .frame(width: 68)
                                                .foregroundColor(.white.opacity(0.3))
                                                .cornerRadius(40)
                                            Text("Share")
                                                .foregroundColor(.black)
                                                .font(.system(size: 15, weight: .medium))
                                        }
                                    }.padding(20)
                                }
                            }
                        }
                        
                        ZStack {
                            Rectangle()
                                .cornerRadius(12)
                                .foregroundColor(.black)
                            HStack {
                                Button {
                                    viewModel.rateApp()
                                } label: {
                                    HStack {
                                        
                                        Image(systemName: "star.square.fill")
                                            .foregroundColor(.white)
                                            .font(.system(size: 28))
                                        
                                        Text("Rate Us")
                                            .foregroundColor(.white)
                                            .font(.system(size: 17, weight: .bold))
                                        Spacer()
                                        ZStack {
                                            Rectangle()
                                                .frame(width: 68)
                                                .foregroundColor(.white.opacity(0.3))
                                                .cornerRadius(40)
                                            Text("Rate")
                                                .foregroundColor(.black)
                                                .font(.system(size: 15, weight: .medium))
                                        }
                                    }.padding(20)
                                }
                            }
                        }
                        
                        ZStack {
                            Rectangle()
                                .cornerRadius(12)
                                .foregroundColor(.black)
                            HStack {
                                Button {
                                    viewModel.openUsagePolicy()
                                } label: {
                                    HStack {
                                        
                                        Image(systemName: "person.badge.shield.checkmark.fill")
                                            .foregroundColor(.white)
                                            .font(.system(size: 28))
                                        Text("Usage policy")
                                            .foregroundColor(.white)
                                            .font(.system(size: 17, weight: .bold))
                                        Spacer()
                                        ZStack {
                                            Rectangle()
                                                .frame(width: 68)
                                                .foregroundColor(.white.opacity(0.3))
                                                .cornerRadius(40)
                                            Text("Read")
                                                .foregroundColor(.black)
                                                .font(.system(size: 15, weight: .medium))
                                        }
                                    }.padding(20)
                                }
                            }
                        }
                        
                    }.padding(.horizontal)
                }
                
                Spacer()
            }.padding(.bottom, 96)
                
        }
    }
}

#Preview {
    SettingsUIView(viewModel: SettingsViewModel())
}
