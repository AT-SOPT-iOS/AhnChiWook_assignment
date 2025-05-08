//
//  Top20HeaderView.swift
//  AT-SOPT-iOS-Assignment
//
//  Created by 안치욱 on 5/7/25.
//


import UIKit

final class Top20HeaderView: UICollectionReusableView, ReuseIdentifiable {

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "오늘의 티빙 TOP 20"
        label.font = .pretendard(.bold, size: 15)
        label.textColor = .white
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
