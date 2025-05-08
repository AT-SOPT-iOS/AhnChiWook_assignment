//
//  LiveModel.swift
//  AT-SOPT-iOS-Assignment
//
//  Created by 안치욱 on 5/8/25.
//

import UIKit

struct LiveModel {
    let image: UIImage
    let number: String
    let name: String
    let detail: String
}


extension LiveModel {
    static func dummy() -> [LiveModel] {
        return [
            LiveModel(image: .top3, number: "1", name: "JTBC", detail: "이혼숙려캠프 34화 \n32.8%"),
            LiveModel(image: .top1, number: "2", name: "tvn", detail: "뿡뿡지구오락실 \n29.3%"),
            LiveModel(image: .top2, number: "3", name: "SPOTV", detail: "UEFA 챔피언스리그 결승 \n11.1%"),
            LiveModel(image: .top4, number: "4", name: "치치 TV", detail: "냠냠치치의 먹방 \n111%"),
            LiveModel(image: .top5, number: "5", name: "꼭튜브", detail: "훈수 두지 말라고 \n222%"),
            LiveModel(image: .top6, number: "6", name: "프레이 TV", detail: "[LOL] 프레이 이즈리얼 \n100%"),
            LiveModel(image: .top6, number: "7", name: "PAKA", detail: "돌아온 럼짱 \n99.9%")
        ]
    }
}
