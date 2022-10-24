//
//  MovieModel.swift
//  MovieApp
//
//  Created by Turan Çabuk on 24.10.2022.
//

import Foundation

struct Movies: Codable {
    let results: [Result]?

     
}

// MARK: - Result
struct Result: Codable {
    let originalLanguage, originalTitle, overview: String?
    let popularity: Double?
    let posterPath, releaseDate, title: String?
    let voteAverage: Double?

    
}
