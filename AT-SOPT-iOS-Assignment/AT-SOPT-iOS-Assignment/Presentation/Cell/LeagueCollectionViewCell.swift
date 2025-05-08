//
//  LeagueCollectionViewCell.swift
//  AT-SOPT-iOS-Assignment
//
//  Created by 안치욱 on 5/8/25.
//

import UIKit
import SnapKit
import Then

class LeagueCollectionViewCell: UICollectionViewCell, ReuseIdentifiable {
    
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
        
        posterImage.do {
            $0.backgroundColor = .gray4
            $0.layer.cornerRadius = 3
        }
        
        posterImage.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.width.equalTo(92)
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
}

extension LeagueCollectionViewCell {
    
    func dataBind(_ myLeagueData: LeagueModel) {
        
        posterImage.image = myLeagueData.image
    }
}
