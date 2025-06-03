//
//  TeamListView.swift
//  TVING_SwiftUI
//
//  Created by 안치욱 on 6/3/25.
//


import SwiftUI

struct TeamListView: View {
    
    private let items: [TeamModel] = TeamModel.allSamples

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(Array(items.enumerated()), id: \.element.id) { index, item in
                    Image(item.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 80)
                        .background(
                            index.isMultiple(of: 2)
                                ? Color.white
                                : Color.black
                        )
                }
            }
            .padding(.horizontal, 0)
            .padding(.vertical, 0)
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}

#Preview {
    TeamListView()
}
