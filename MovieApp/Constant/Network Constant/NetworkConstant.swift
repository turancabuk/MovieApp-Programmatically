//
//  NetworkConstant.swift
//  MovieApp
//
//  Created by Turan Çabuk on 25.10.2022.
//  http://www.omdbapi.com/apikey.aspx?VERIFYKEY=76c014f6-7dad-456d-81e3-7b37725dbd54
import Foundation

extension Constant {
    class NetworkConstant{
        enum SearchMovieServiceEndPoint: String {
            case BASE_URL = "http://www.omdbapi.com"
            case API_KEY = "apikey=357e15d8"
            
            static func searchMovie(searchMovieName: String) -> String {
                "\(BASE_URL.rawValue)?s=\(searchMovieName)&\(API_KEY.rawValue)"
            }
            
            static func detailMovie(movieImdbId: String) -> String {
                "\(BASE_URL.rawValue)?i=\(movieImdbId)&\(API_KEY.rawValue)"
            }
        }
    }
    }

//http://www.omdbapi.com/?s=searchMovieName&apikey=357e15d8
//http://www.omdbapi.com/?i=movieImdbId=&apikey=357e15d8

