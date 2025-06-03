//
//  LiveModel.swift
//  TVING_SwiftUI
//
//  Created by 안치욱 on 6/3/25.
//


import Foundation

struct LiveModel: Identifiable {
    let id = UUID()
    let number: String
    let name: String
    let detail: String
    let imageName: String
}

extension LiveModel {
    static let allSamples: [LiveModel] = [
        LiveModel(number: "1", name: "JTBC", detail: "이혼숙려캠프 34화 \n32.8%", imageName: "Top3"),
        LiveModel(number: "2", name: "tvn", detail: "뿡뿡지구오락실 \n29.3%", imageName: "Top1"),
        LiveModel(number: "3", name: "SPOTV", detail: "UEFA 챔피언스리그 결승 \n11.1%", imageName: "Top2"),
        LiveModel(number: "4", name: "치치 TV", detail: "냠냠치치의 먹방 \n111%", imageName: "Top4"),
        LiveModel(number: "5", name: "꼭튜브", detail: "훈수 두지 말라고 \n222%", imageName: "Top5"),
        LiveModel(number: "6", name: "프레이 TV", detail: "[LOL] 프레이 이즈리얼 \n100%", imageName: "Top6"),
        LiveModel(number: "7", name: "PAKA", detail: "돌아온 럼짱 \n99.9%", imageName: "Top6")
    ]
}
