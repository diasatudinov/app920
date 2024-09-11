//
//  MemoryCell.swift
//  app920
//
//  Created by Dias Atudinov on 11.09.2024.
//

import SwiftUI

struct MemoryCell: View {
    @State var memory: Memory
    var body: some View {
        ZStack {
            Color.clear
            
            VStack {
                VStack {
                    HStack {
                        Text(memory.heading)
                            .foregroundColor(.white)
                            .bold()
                        Spacer()
                        
                        HStack(spacing: 0) {
                            Text("Edit")
                                .font(.system(size: 15))
                            Image(systemName: "chevron.right")
                        }.foregroundColor(.red)
                        
                    }
                    
                    Text(memory.description).foregroundColor(.white)
                        .font(.system(size: 15))
                        .frame(maxWidth: .infinity)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(.red , lineWidth: 1)
                        ).frame(height: 76)
                    
                }
                
                
                if let image = memory.image {
                    Image(uiImage: image)
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width - 32 , height: 220)
                } else {
                    Image("firstScreen920")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width - 32, height: 220)
                }
                
            }
        }.frame(height: 338).cornerRadius(10)
    }
}

#Preview {
    MemoryCell(memory: Memory(heading: "Mona Lisa", description: "asdsadasd sadsdadasd asdasdasd asdasdasd asdasdasd asdasdasd asdasdasd asdasdasd asdasd asdsadasd asdasdasd asdasd"))
}
