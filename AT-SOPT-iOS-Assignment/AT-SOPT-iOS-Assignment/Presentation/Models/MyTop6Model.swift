//
//  MyTop6Model.swift
//  AT-SOPT-iOS-Assignment
//
//  Created by 안치욱 on 5/7/25.
//

import UIKit

struct MyTop6Model {
    let image: UIImage
}

extension MyTop6Model {
    static func dummy() -> [MyTop6Model] {
        return [
            MyTop6Model(image: .top1),
            MyTop6Model(image: .top2),
            MyTop6Model(image: .top3),
            MyTop6Model(image: .top4),
            MyTop6Model(image: .top5),
            MyTop6Model(image: .top6)
        ]
    }
}
