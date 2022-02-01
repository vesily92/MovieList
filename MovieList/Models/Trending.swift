//
//  Trending.swift
//  MovieList
//
//  Created by Василий Пронин on 26.01.2022.
//
enum Link: String {
    case trending = "https://api.themoviedb.org/3/trending/movie/week?api_key=dfb2c09ce9a1c44b17438d980781f789"
}
struct Trending: Codable {
    let page: Int?
    let moviesTrending: [MoviesTrending]
    let totalPages: Int?
    let totalResults: Int?
    
    enum CodingKeys: String, CodingKey {
        case page = "page"
        case moviesTrending = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

struct MoviesTrending: Codable {
    let posterPath: String?
    let title: String?
    
    enum CodingKeys: String, CodingKey {
        case posterPath = "poster_path"
        case title = "title"
    }
}
