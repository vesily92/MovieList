//
//  MovieDetails.swift
//  MovieList
//
//  Created by Василий Пронин on 24.01.2022.
//

enum Link1: String {
    case movieDetails = "https://imdb-internet-movie-database-unofficial.p.rapidapi.com/film/tt1375666"
}

//enum Headers: [String: String] {
//    case header =  [
//        "x-rapidapi-host": "imdb-internet-movie-database-unofficial.p.rapidapi.com",
//        "x-rapidapi-key": "aa2146b9demsh3d743b35b727ff9p12d6a0jsn1920e1cc12ba"
//    ]
//}



struct MovieDetails: Decodable {
    let id: String?
    let title: String?
    let year: String?
    let length: String?
    let rating: String?
    let ratingVotes: String?
    let poster: String?
    let plot: String?
    let trailer: Trailer?
    let cast: [Cast]?
//    let technicalSpecs: [String]
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case year = "year"
        case length = "length"
        case rating = "rating"
        case ratingVotes = "rating_votes"
        case poster = "poster"
        case plot = "plot"
        case trailer = "trailer"
        case cast = "cast"
//        case technicalSpecs = "technical_specs"
    }
}

struct Trailer: Decodable {
    let id: String?
    let link: String?
}

struct Cast: Decodable {
    let actor: String?
    let actorID: String?
    let character: String?
    
    enum CodingKeys: String, CodingKey {
        case actor = "actor"
        case actorID = "actor_id"
        case character = "character"
    }
}

//struct TechnicalSpecs: Decodable {
//
//}
