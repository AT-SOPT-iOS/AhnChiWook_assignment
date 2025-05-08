//
//  MyTop6CollectionViewCell.swift
//  AT-SOPT-iOS-Assignment
//
//  Created by 안치욱 on 5/7/25.
//

import UIKit
import SnapKit
import Then

class MyTop6CollectionViewCell: UICollectionViewCell, ReuseIdentifiable {
    
    private let posterImage = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        
        contentView.addSubview(posterImage)
        
        posterImage.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.width.equalTo(160)
            $0.height.equalTo(90)
        }
    }
}

extension MyTop6CollectionViewCell {
    
    func dataBind(_ myTop6Data: MyTop6Model) {
        
        posterImage.image = myTop6Data.image
    }
}
