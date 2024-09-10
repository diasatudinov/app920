//
//  AttractionCellUIView.swift
//  app920
//
//  Created by Dias Atudinov on 10.09.2024.
//

import SwiftUI

struct AttractionCellUIView: View {
    var body: some View {
        ZStack {
            Color.black
            VStack {
                Image("firstScreen920")
                    .resizable()
                    .frame(height: 130)
                HStack {
                    VStack(alignment: .leading) {
                        Text("Louvre")
                            .font(.system(size: 17, weight: .semibold))
                        Text("France, Paris")
                            .font(.system(size: 15))
                    }.foregroundColor(.white).padding(.bottom)
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text("30 $")
                            .font(.system(size: 16, weight: .semibold))
                        Text("Historical").foregroundColor(.red)
                            .font(.system(size: 15))
                            .italic()
                    }.foregroundColor(.white).padding(.bottom)
                }.frame(maxHeight: .infinity).padding(.horizontal)
            }
        }.frame(height: 186).cornerRadius(10)
    }
}

#Preview {
    AttractionCellUIView()
}
