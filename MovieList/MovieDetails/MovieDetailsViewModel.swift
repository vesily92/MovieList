//
//  MovieDetailsViewModel.swift
//  MovieList
//
//  Created by Василий Пронин on 24.01.2022.
//

import Foundation

protocol MovieDetailsViewModelProtocol {
    var movieName: String { get }
    init(movie: MovieDetails)
}
