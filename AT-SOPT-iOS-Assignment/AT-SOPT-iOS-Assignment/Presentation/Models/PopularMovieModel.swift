//
//  PopularMovieModel.swift
//  AT-SOPT-iOS-Assignment
//
//  Created by 안치욱 on 5/7/25.
//

import UIKit

struct PopularMovieModel {
    let image: UIImage
}

extension PopularMovieModel {
    static func dummy() -> [PopularMovieModel] {
        return [
            PopularMovieModel(image: .image96),
            PopularMovieModel(image: .image98),
            PopularMovieModel(image: .image100),
            PopularMovieModel(image: .image124),
            PopularMovieModel(image: .image20),
            PopularMovieModel(image: .image96),
            PopularMovieModel(image: .image98),
            PopularMovieModel(image: .image100),
            PopularMovieModel(image: .image124),
            PopularMovieModel(image: .image20),
            PopularMovieModel(image: .image96),
            PopularMovieModel(image: .image98),
            PopularMovieModel(image: .image100),
            PopularMovieModel(image: .image124),
            PopularMovieModel(image: .image20)
        ]
    }
}
