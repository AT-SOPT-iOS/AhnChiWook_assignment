//
//  BoxOfficeService.swift
//  AT-SOPT-iOS-Assignment
//
//  Created by 안치욱 on 5/12/25.
//


import Foundation

func fetchSimpleBoxOffice(date: String, completion: @escaping (Result<[BoxOfficeMovie], Error>) -> Void) {
    let APIKey = Bundle.main.infoDictionary?["APIkey"] as! String
    
    let urlString = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchWeeklyBoxOfficeList.json?key=\(APIKey)&targetDt=\(date)&weekGb=1"
    
    guard let url = URL(string: urlString) else {
        completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "URL 생성 실패"])))
        return
    }

    URLSession.shared.dataTask(with: url) { data, _, error in
        if let error = error {
            completion(.failure(error))
            return
        }

        guard let data = data else { return }

        do {
            let decoded = try JSONDecoder().decode(BoxOfficeResponse.self, from: data)
            completion(.success(decoded.boxOfficeResult.weeklyBoxOfficeList))
        } catch {
            completion(.failure(error))
        }
    }.resume()
}
