//
//  PopularMovieModel.swift
//  TVING_SwiftUI
//
//  Created by 안치욱 on 6/3/25.
//


import Foundation

struct PopularMovieModel: Identifiable {
    let id = UUID()
    let imageName: String
}

extension PopularMovieModel {
    static let allSamples: [PopularMovieModel] = [
        PopularMovieModel(imageName: "movie1"),
        PopularMovieModel(imageName: "movie2"),
        PopularMovieModel(imageName: "movie3"),
        PopularMovieModel(imageName: "movie4"),
        PopularMovieModel(imageName: "movie5"),
        PopularMovieModel(imageName: "movie2"),
        PopularMovieModel(imageName: "movie3"),
        PopularMovieModel(imageName: "movie4"),
        PopularMovieModel(imageName: "movie5")
    ]
}
