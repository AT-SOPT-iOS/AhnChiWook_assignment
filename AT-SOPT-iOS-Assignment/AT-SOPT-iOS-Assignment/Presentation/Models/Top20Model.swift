//
//  Top20Model.swift
//  AT-SOPT-iOS-Assignment
//
//  Created by 안치욱 on 5/3/25.
//

import UIKit

struct Top20Model {
    let image: UIImage
    let number: String
}

extension Top20Model {
    static func dummy() -> [Top20Model] {
        return [
            Top20Model(image: .poster1, number: "1"),
            Top20Model(image: .poster2, number: "2"),
            Top20Model(image: .poster3, number: "3"),
            Top20Model(image: .poster4, number: "4"),
            Top20Model(image: .poster5, number: "5"),
            Top20Model(image: .poster6, number: "6"),
            Top20Model(image: .poster7, number: "7"),
            Top20Model(image: .poster8, number: "8"),
            Top20Model(image: .poster1, number: "9"),
            Top20Model(image: .poster2, number: "10"),
            Top20Model(image: .poster3, number: "11"),
            Top20Model(image: .poster4, number: "12"),
            Top20Model(image: .poster5, number: "13"),
            Top20Model(image: .poster6, number: "14"),
            Top20Model(image: .poster7, number: "15"),
            Top20Model(image: .poster8, number: "16"),
            Top20Model(image: .poster1, number: "17"),
            Top20Model(image: .poster2, number: "18"),
            Top20Model(image: .poster3, number: "19"),
            Top20Model(image: .poster4, number: "20")
        ]
    }
}
