//
//  KBOCollectionViewCell.swift
//  AT-SOPT-iOS-Assignment
//
//  Created by 안치욱 on 5/8/25.
//

import UIKit
import SnapKit
import Then

class KBOCollectionViewCell: UICollectionViewCell, ReuseIdentifiable {
    
    private let posterImage = UIImageView()
    private var number = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        
        contentView.addSubviews(posterImage)
        
        posterImage.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}

extension KBOCollectionViewCell {
    
    func dataBind(_ kboData: KBOModel) {
        
        number = kboData.number
        posterImage.image = kboData.image
    }
}
