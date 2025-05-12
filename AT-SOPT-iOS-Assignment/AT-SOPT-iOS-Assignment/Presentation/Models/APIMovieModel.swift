//
//  APIMovieModel.swift
//  AT-SOPT-iOS-Assignment
//
//  Created by 안치욱 on 5/9/25.
//

import Foundation

struct BoxOfficeResponse: Decodable {
    let boxOfficeResult: BoxOfficeResult
}

struct BoxOfficeResult: Decodable {
    let weeklyBoxOfficeList: [BoxOfficeMovie]
}

struct BoxOfficeMovie: Decodable {
    let rank: String
    let movieNm: String
    let openDt: String
}
