//
//  PopularMovieView.swift
//  TVING_SwiftUI
//
//  Created by 안치욱 on 6/3/25.
//


import SwiftUI

struct PopularMovieView: View {
    
    private let items: [PopularMovieModel] = PopularMovieModel.allSamples

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Text("실시간 인기 영화")
                    .foregroundColor(.white)
                    .font(.custom("Pretendard-Bold", size: 20))
                Spacer()
                Button(action: {
                    print("실시간 인기 영화 더보기 탭")
                }) {
                    Text("더보기")
                        .foregroundColor(.white.opacity(0.7))
                        .font(.system(size: 14, weight: .semibold))
                }
            }
            .padding(.horizontal, 16)
            .padding(.top, 20)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(items) { item in
                        Image(item.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 140, height: 220)
                            .clipped()
                            .cornerRadius(8)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 20)
            }
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}
