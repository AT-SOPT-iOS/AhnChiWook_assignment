//
//  LiveView.swift
//  TVING_SwiftUI
//
//  Created by 안치욱 on 6/3/25.
//


import SwiftUI


struct LiveCell: View {
    let item: LiveModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(item.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 220, height: 120)
                .clipped()
                .cornerRadius(8)

            HStack(alignment: .firstTextBaseline, spacing: 4) {
                Text(item.number)
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(.white)
                    .fixedSize()
                    .offset(y: 4)
                
                Text(item.name)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.white)
                
                Spacer()
            }
            
            Text(item.detail)
                .font(.system(size: 14))
                .foregroundColor(.white.opacity(0.8))
                .lineLimit(nil)
        }
        .frame(width: 220)
        .padding(.vertical, 8)
    }
}

struct LiveView: View {
    private let items = LiveModel.allSamples
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Text("실시간 인기 LIVE")
                    .font(.custom("Pretendard-Bold", size: 20))
                    .foregroundColor(.white)
                
                Spacer()
                
                Button(action: {
                    print("더보기 클릭됨")
                }) {
                    Text("더보기")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.white.opacity(0.7))
                }
            }
            .padding(.horizontal, 16)
            .padding(.top, 20)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(items) { item in
                        LiveCell(item: item)
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
    LiveView()
}
