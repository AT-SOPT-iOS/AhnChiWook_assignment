//
//  LeagueModel.swift
//  AT-SOPT-iOS-Assignment
//
//  Created by 안치욱 on 5/8/25.
//

import UIKit

struct LeagueModel {
    let image: UIImage
}

extension LeagueModel {
    static func dummy() -> [LeagueModel] {
        return [
            LeagueModel(image: .image110),
            LeagueModel(image: .image109),
            LeagueModel(image: .image111),
            LeagueModel(image: .image112),
            LeagueModel(image: .image110)
        ]
    }
}
