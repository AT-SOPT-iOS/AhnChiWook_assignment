//
//  Top20Model.swift
//  TVING_SwiftUI
//
//  Created by 안치욱 on 6/3/25.
//

import Foundation


struct Top20Model: Identifiable {
    let id = UUID()
    let rank: String
    let imageName: String
}

extension Top20Model {
    static let allSamples: [Top20Model] = [
        Top20Model(rank: "1", imageName: "poster1"),
        Top20Model(rank: "2", imageName: "poster2"),
        Top20Model(rank: "3", imageName: "poster3"),
        Top20Model(rank: "4", imageName: "poster4"),
        Top20Model(rank: "5", imageName: "poster5"),
        Top20Model(rank: "6", imageName: "poster6"),
        Top20Model(rank: "7", imageName: "poster7"),
        Top20Model(rank: "8", imageName: "poster8")
    ]
}
