//
//  TeamModel.swift
//  TVING_SwiftUI
//
//  Created by 안치욱 on 6/3/25.
//


import Foundation

struct TeamModel: Identifiable {
    let id = UUID()
    let imageName: String
}

extension TeamModel {
    static let allSamples: [TeamModel] = [
        TeamModel(imageName: "ssg"),
        TeamModel(imageName: "kia"),
        TeamModel(imageName: "doosan"),
        TeamModel(imageName: "hanhwa"),
        TeamModel(imageName: "kiwoom"),
        TeamModel(imageName: "lg"),
        TeamModel(imageName: "kt"),
        TeamModel(imageName: "samsung"),
        TeamModel(imageName: "nc"),
        TeamModel(imageName: "lotte")
    ]
}
