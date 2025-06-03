//
//  ServiceModel.swift
//  TVING_SwiftUI
//
//  Created by 안치욱 on 6/3/25.
//


import Foundation

struct ServiceModel: Identifiable {
    let id = UUID()
    let imageName: String
}

extension ServiceModel {
    static let allSamples: [ServiceModel] = [
        ServiceModel(imageName: "image 109"),
        ServiceModel(imageName: "image 110"),
        ServiceModel(imageName: "image 111"),
        ServiceModel(imageName: "image 112"),
        ServiceModel(imageName: "image 109"),
        ServiceModel(imageName: "image 110"),
        ServiceModel(imageName: "image 111"),
        ServiceModel(imageName: "image 112")
    ]
}
