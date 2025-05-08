//
//  PopularMovieCollectionViewCell.swift
//  AT-SOPT-iOS-Assignment
//
//  Created by 안치욱 on 5/7/25.
//

import UIKit
import SnapKit
import Then

class PopularMovieCollectionViewCell: UICollectionViewCell, ReuseIdentifiable {
    
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
            $0.width.equalTo(98)
            $0.height.equalTo(146)
        }
    }
}

extension PopularMovieCollectionViewCell {
    
    func dataBind(_ popMovieData: PopularMovieModel) {
        
        posterImage.image = popMovieData.image
    }
}
