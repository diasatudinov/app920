//
//  LoaderUIView.swift
//  app920
//
//  Created by Dias Atudinov on 10.09.2024.
//

import SwiftUI

struct LoaderUIView: View {
    @State private var progress: Double = 0.0
    @State private var timer: Timer?
    @State private var isLoadingView: Bool = true

    var body: some View {
        if isLoadingView {
            ZStack {
                Color.mainBg
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    Image("logo920")
                    
                    Spacer()
                    Spacer()
                    ZStack {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .red))
                            .scaleEffect(x: 1.7, y: 1.7, anchor: .center)
                            
                            
                    }
                    .foregroundColor(.black)
                    .padding(14)
                    .padding(.bottom, 60)
                }
                .onAppear {
                    startTimer()
                }
                .onDisappear {
                    timer?.invalidate()
                }
                
            }
            
        } else {
            
            ReOnboardingUIView()
            
            
            
        }
    }
    func startTimer() {
        timer?.invalidate()
        progress = 0
        timer = Timer.scheduledTimer(withTimeInterval: 0.07, repeats: true) { timer in
            if progress < 100 {
                progress += 1
            } else {
                timer.invalidate()
                isLoadingView.toggle()
            }
        }
    }
    
}

#Preview {
    LoaderUIView()
}
