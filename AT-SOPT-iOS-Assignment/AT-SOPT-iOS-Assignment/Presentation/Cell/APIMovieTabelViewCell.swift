//
//  APIMovieTabelViewCell.swift
//  AT-SOPT-iOS-Assignment
//
//  Created by 안치욱 on 5/12/25.
//

import UIKit

class APIMovieTableViewCell: UITableViewCell, ReuseIdentifiable {

    private let movieNameLabel = UILabel().then {
        $0.font = .pretendard(.medium, size: 15)
        $0.textColor = .black
    }
    
    private let openDateLabel = UILabel().then {
        $0.font = .pretendard(.medium, size: 12)
        $0.textColor = .black
    }
    
    private let rankNum = UILabel().then {
        $0.font = .pretendard(.semiBold, size: 25)
        $0.textColor = .black
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setHierarchy()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setHierarchy() {
        self.addSubviews(
            movieNameLabel,
            openDateLabel,
            rankNum
        )
    }
    private func setLayout() {
        rankNum.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(5)
        }
        movieNameLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(55)
            $0.top.equalToSuperview().offset(4)
        }
        openDateLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(55)
            $0.top.equalTo(movieNameLabel.snp.bottom).offset(2)
        }
    }
    
    func configure(with movie: BoxOfficeMovie) {
        rankNum.text = movie.rank
        movieNameLabel.text = movie.movieNm
        openDateLabel.text = "개봉일: \(movie.openDt)"
    }
    
}

