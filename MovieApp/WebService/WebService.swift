//
//  WebService.swift
//  MovieApp
//
//  Created by Turan Çabuk on 25.10.2022.
// 

import Alamofire

protocol MovieServiceProtocols {
    func searchMovie(searchMovieName: String, completion: @escaping ([Search]?) -> Void)
    func getMovieDetail(movieImdbId: String, completion: @escaping (DetailResults?) -> Void)
}

final class Services: MovieServiceProtocols {
    func searchMovie(searchMovieName: String, completion: @escaping ([Search]?) -> Void) {
        AF.request(Constant.NetworkConstant.SearchMovieServiceEndPoint.searchMovie(searchMovieName: searchMovieName)).responseDecodable(of: Result.self) { data in
            guard let data = data.value else {
                completion(nil)
                return
            }
            completion(data.search)
        }
    }
    
    func getMovieDetail(movieImdbId: String, completion: @escaping (DetailResults?) -> Void) {
        AF.request(Constant.NetworkConstant.SearchMovieServiceEndPoint.detailMovie(movieImdbId: movieImdbId)).responseDecodable(of: DetailResults.self) { data in
            guard let data = data.value else {
                completion(nil)
                return
            }
            completion(data)
        }
    }
}
