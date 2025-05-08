//
//  ReuseIdentifiable.swift
//  AT-SOPT-iOS-Assignment
//
//  Created by 안치욱 on 5/3/25.
//


import Foundation

protocol ReuseIdentifiable {
    static var reuseIdentifier: String { get }
}

extension ReuseIdentifiable {
    static var reuseIdentifier: String { String(describing: Self.self) }
}
