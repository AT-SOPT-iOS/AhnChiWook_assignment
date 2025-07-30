//
//  BottomView.swift
//  TVING_SwiftUI
//
//  Created by 안치욱 on 6/3/25.
//


import SwiftUI

struct BottomView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                HStack(spacing: 4) {
                    Text("공지")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.vertical, 4)
                        .padding(.horizontal, 8)
                        .background(Color(white: 0.15))
                        .cornerRadius(4)
                    
                    Text("티빙 계정 공유 정책 추가 안내")
                        .font(.subheadline)
                        .foregroundColor(.white)
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
            .padding()
            .background(Color(white: 0.12))
            .cornerRadius(8)
            .padding(.horizontal, 16)
            
            HStack(spacing: 8) {
                Text("고객문의 · 이용약관 · \n사업자정보 · 인재채용")
            }
            .font(.footnote)
            .foregroundColor(Color(white: 0.7))
            .padding(24)
            
            Spacer(minLength: 20)
        }
        .padding(.bottom, 20)
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}

#Preview {
    BottomView()
}
