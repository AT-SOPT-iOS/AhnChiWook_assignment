//
//  Top20CollectionViewCell.swift
//  AT-SOPT-iOS-Assignment
//
//  Created by 안치욱 on 5/3/25.
//

import UIKit
import SnapKit
import Then

class Top20CollectionViewCell: UICollectionViewCell, ReuseIdentifiable {
    
    private let numberLabel = UILabel()
    private let posterImage = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        
        numberLabel.do {
            $0.textAlignment = .right
            $0.font = .italicSystemFont(ofSize: 25)
            $0.textColor = .white
        }
        
    }
    
    private func setLayout() {
        
        contentView.addSubviews(
            posterImage,
            numberLabel
        )
        
        posterImage.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview()
            $0.width.equalTo(98)
            $0.height.equalTo(146)
        }
        
        numberLabel.snp.makeConstraints {
            $0.trailing.equalTo(posterImage.snp.leading)
            $0.bottom.equalToSuperview()
        }
        
    }
}

extension Top20CollectionViewCell {
    
    func dataBind(_ top20Data: Top20Model) {
        
        posterImage.image = top20Data.image
        numberLabel.text = top20Data.number
    }
}
