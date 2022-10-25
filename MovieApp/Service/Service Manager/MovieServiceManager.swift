//
//  MovieServiceManager.swift
//  MovieApp
//
//  Created by Turan Çabuk on 24.10.2022.
//

import Alamofire

final class MovieServiceManager {
    static let shared: MovieServiceManager = MovieServiceManager()
}

extension MovieServiceManager {
    func fetch<T>(path: String, onSucces: @escaping (T) -> (), onError: (AFError) -> ()) where T: Codable {
        AF.request(path, encoding: JSONEncoding.default).validate().responseDecodable(of: T.self) { response in
            guard let model = response.value else { print(response.error as Any); return }
            onSucces(model)
        }
    }
}
