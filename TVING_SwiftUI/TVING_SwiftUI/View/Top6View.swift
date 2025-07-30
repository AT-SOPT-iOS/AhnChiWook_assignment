//
//  Top6View.swift
//  TVING_SwiftUI
//
//  Created by 안치욱 on 6/3/25.
//


import SwiftUI

struct Top6View: View {
    private let items: [Top6Model] = Top6Model.allSamples

    @State private var selectedIndex: Int? = nil

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("치치PD의 인생작 TOP 6")
                .foregroundColor(.white)
                .font(.custom("Pretendard-Bold", size: 20))
                .padding(.horizontal, 16)
                .padding(.top, 20)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(Array(items.enumerated()), id: \.element.id) { index, item in
                        ZStack {
                            Image(item.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 240, height: 140)
                                .clipped()
                                .cornerRadius(8)
                        }
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 20)
            }
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}

