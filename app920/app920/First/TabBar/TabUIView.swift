//
//  TabUIView.swift
//  app920
//
//  Created by Dias Atudinov on 10.09.2024.
//

import SwiftUI

struct TabUIView: View {
    @State var selectedTab = 0
    private let tabs = ["Home", "Attractions", "Memories", "Settings"]
    

    @ObservedObject var attractionVM = AttractionViewModel()
    @ObservedObject var settingsVM = SettingsViewModel()
    var body: some View {
        ZStack {
            
            switch selectedTab {
            case 0:
                HomeUIView(viewModel: attractionVM, settingsVM: settingsVM, tabNum: $selectedTab)
                    
            case 1:
                AttractionsUIView(viewModel: attractionVM, settingsVM: settingsVM)

            case 2:
                MemoriesUIView(viewModel: attractionVM, settingsVM: settingsVM, tabNum: $selectedTab)
            case 3:
               SettingsUIView(viewModel: settingsVM)
            default:
                Text("default")
            }
                VStack {
                    Spacer()
                    
                    ZStack {
                        Rectangle()
                            .fill(Color.mainBg)
                            .frame(height: 80)
                            
                        HStack(spacing: 50) {
                            ForEach(0..<tabs.count) { index in
                                Button(action: {
                                    selectedTab = index
                                }) {
                                    
                                    ZStack {
                                        VStack {
                                            Image(systemName: icon(for: index))
                                                .font(.system(size: 20, weight: .semibold))
                                                .padding(.bottom, 2)
                                            Text(text(for: index))
                                                .font(.system(size: 10, weight: .semibold))
                                        }.foregroundColor(selectedTab == index ? Color.redBtn : Color.gray)
                                    }
                                }
                                
                            }
                        }.padding(.bottom, 5)
                        
                        Rectangle()
                            .fill(Color.black)
                            .frame(height: 1)
                            .padding(.bottom, 78)
                    }
                    
                }.ignoresSafeArea()
            
        }
    }
    
    private func icon(for index: Int) -> String {
        switch index {
        case 0: return "house.fill"
        case 1: return "bus"
        case 2: return "camera.fill"
        case 3: return "gear"
        default: return ""
        }
    }
    
    private func text(for index: Int) -> String {
        switch index {
        case 0: return "Home"
        case 1: return "Attractions"
        case 2: return "Memories"
        case 3: return "Settings"
        default: return ""
        }
    }
}

#Preview {
    TabUIView()
}
