//
//  KBOModel.swift
//  AT-SOPT-iOS-Assignment
//
//  Created by 안치욱 on 5/8/25.
//

import UIKit

struct KBOModel {
    let image: UIImage
    let number: Int
}

extension KBOModel {
    static func dummy() -> [KBOModel] {
        return [
            KBOModel(image: .ssg2, number: 1),
            KBOModel(image: .hanhwa, number: 2),
            KBOModel(image: .nc, number: 3),
            KBOModel(image: .dusan, number: 4),
            KBOModel(image: .lg, number: 5),
            KBOModel(image: .kia, number: 6),
            KBOModel(image: .kt, number: 7),
            KBOModel(image: .lotte, number: 8),
            KBOModel(image: .kiwoom, number: 9),
            KBOModel(image: .samsung, number: 10)
        ]
    }
}
