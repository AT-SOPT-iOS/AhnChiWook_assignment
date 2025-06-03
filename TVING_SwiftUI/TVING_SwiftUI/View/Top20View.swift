//
//  Top20View.swift
//  TVING_SwiftUI
//
//  Created by 안치욱 on 6/2/25.
//

import SwiftUI

struct Top20View: View {
    private let items: [Top20Model] = Top20Model.allSamples
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Text("오늘의 티빙 Top 20")
                    .foregroundColor(.white)
                    .font(.custom("Pretendard-Bold", size: 24))
                Spacer()
            }
            .padding(.horizontal, 16)
            .padding(.top, 20)
            
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 24) {
                    ForEach(items) { item in
                        HStack(alignment: .bottom, spacing: 8) {
                            Text(item.rank)
                                .font(.system(size: 72, weight: .bold))
                                .foregroundColor(.white)
                                .fixedSize()
                            
                            Image(item.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 120, height: 180)
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

#Preview {
    Top20View()
}
