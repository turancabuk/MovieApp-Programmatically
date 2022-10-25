//
//  ServiceConstant.swift
//  MovieApp
//
//  Created by Turan Çabuk on 25.10.2022.
//  http://api.themoviedb.org/3/discover/movie?api_key=f0248dafeabb67452e6a4872059a3601

import Foundation

extension Constant {
    enum ServiceEndPoint: String {
        case BASE_URL = ""
        case API_KEY = " "
        
        static func moviesServiceEndPoint() -> String {
            "\(BASE_URL.rawValue)\(API_KEY.rawValue)"
        }
    }
}
