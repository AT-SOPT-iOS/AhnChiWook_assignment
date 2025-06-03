//
//  ServiceListView.swift
//  TVING_SwiftUI
//
//  Created by 안치욱 on 6/3/25.
//


import SwiftUI

struct ServiceListView: View {

    private let items: [ServiceModel] = ServiceModel.allSamples

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(items) { item in
                    Image(item.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 40)
                        .padding(.vertical, 16)
                        .padding(.horizontal, 24)
                        .background(Color(white: 0.12))
                        .cornerRadius(8)
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}

#Preview {
    ServiceListView()
}
