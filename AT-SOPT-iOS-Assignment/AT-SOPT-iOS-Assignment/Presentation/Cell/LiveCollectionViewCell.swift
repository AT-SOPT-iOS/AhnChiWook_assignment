//
//  LiveCollectionViewCell.swift
//  AT-SOPT-iOS-Assignment
//
//  Created by 안치욱 on 5/3/25.
//

import UIKit
import SnapKit
import Then

class LiveCollectionViewCell: UICollectionViewCell, ReuseIdentifiable {
    
    private let numberLabel = UILabel()
    private let posterImage = UIImageView()
    private let programName = UILabel()
    private let detailLabel = UILabel()
    
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
            $0.textAlignment = .left
            $0.font = .italicSystemFont(ofSize: 15)
            $0.textColor = .white
        }
        programName.do {
            $0.textAlignment = .left
            $0.font = .pretendard(.medium, size: 10)
            $0.textColor = .white
        }
        detailLabel.do {
            $0.textAlignment = .left
            $0.font = .pretendard(.medium, size: 10)
            $0.textColor = .gray2
        }
        
    }
    
    private func setLayout() {
        
        contentView.addSubviews(
            posterImage,
            numberLabel,
            programName,
            detailLabel
        )
        
        posterImage.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.width.equalTo(160)
            $0.height.equalTo(90)
        }
        
        numberLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(5)
            $0.top.equalTo(posterImage.snp.bottom).offset(5)
        }
        
        programName.snp.makeConstraints {
            $0.top.equalTo(posterImage.snp.bottom).offset(5)
            $0.leading.equalTo(numberLabel.snp.trailing).offset(2)
        }
        
        detailLabel.snp.makeConstraints {
            $0.top.equalTo(programName.snp.bottom)
            $0.leading.equalTo(numberLabel.snp.trailing).offset(2)
        }
        
    }
}

extension LiveCollectionViewCell {
    func dataBind(_ liveData: LiveModel) {
        posterImage.image = liveData.image
        numberLabel.text = liveData.number
        programName.text = liveData.name
        detailLabel.text = liveData.detail
    }
}

