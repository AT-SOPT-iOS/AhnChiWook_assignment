//
//  Top6Model.swift
//  TVING_SwiftUI
//
//  Created by 안치욱 on 6/3/25.
//

import Foundation

struct Top6Model: Identifiable {
    let id = UUID()
    let imageName: String
}

extension Top6Model {
    static let allSamples: [Top6Model] = [
        Top6Model(imageName: "Top1"),
        Top6Model(imageName: "Top2"),
        Top6Model(imageName: "Top3"),
        Top6Model(imageName: "Top4"),
        Top6Model(imageName: "Top5"),
        Top6Model(imageName: "Top6")
    ]
}
