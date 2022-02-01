//
//  NetworkManager.swift
//  MovieList
//
//  Created by Василий Пронин on 24.01.2022.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    let titles = ["Interstellar", "1917", "There Will Be Blood", "Raw"]
    
    private init() {}

//    func fetchData(from url: String?, with completion: @escaping(MovieDetails) -> Void) {
//        guard let url = URL(string: url ?? "") else { return }
//
//        URLSession.shared.dataTask(with: url) { data, _, error in
//            guard let data = data else {
//                print(error?.localizedDescription ?? "No error description")
//                return
//            }
//
//            do {
//                let movieDetails = try JSONDecoder().decode(MovieDetails.self, from: data)
//                DispatchQueue.main.async {
//                    completion(movieDetails)
//                }
//            } catch let error {
//                print(error)
//            }
//        }.resume()
//    }
    
    func fetchData(from url: String?, with completion: @escaping(Trending) -> Void) {
        
        guard let url = URL(string: url ?? "") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let trending = try JSONDecoder().decode(Trending.self, from: data)
                DispatchQueue.main.async {
                    completion(trending)
                }
            } catch let error {
                print(error)
            }

        }.resume()
    }
    
    func fetchData1(from url: String?, with completion: @escaping(MovieDetails) -> Void) {
        let header = [
            "x-rapidapi-host": "imdb-internet-movie-database-unofficial.p.rapidapi.com",
            "x-rapidapi-key": "aa2146b9demsh3d743b35b727ff9p12d6a0jsn1920e1cc12ba"
        ]

        guard let url = URL(string: url ?? "") else { return }
        
        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = header
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let movieDetails = try JSONDecoder().decode(MovieDetails.self, from: data)
                DispatchQueue.main.async {
                    completion(movieDetails)
                }
            } catch let error {
                print(error)
            }
            
//        header: [String: String], and
            
//            if let error = error {
//                completion(.failure(error))
//            } else {
//                let httpResponse = response as? HTTPURLResponse
//                print(httpResponse)
//                completion(.success(data!))
//            }
        }.resume()
    }
}


class ImageManager {
    
    static var shared = ImageManager()
    
    private init() {}
    
    func fetchImage(from url: String?) -> Data? {
        guard let imageUrl = URL(string: url ?? "") else { return nil }
        return try? Data(contentsOf: imageUrl)
    }
}
