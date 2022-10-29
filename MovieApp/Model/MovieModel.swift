//
//  MovieModel.swift
//  MovieApp
//
//  Created by Turan Çabuk on 24.10.2022.
//

import Foundation

struct Result: Codable {
    let search: [Search]?
    
    enum CodingKeys: String, CodingKey {
        case search = "Search"
    }
}

// MARK: - Result
struct Search: Codable {
    let title, year, imdbID: String
    let poster: String
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID
        case poster = "Poster"
        
    }
}
