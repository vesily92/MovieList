//
//  MovieDetailsViewController.swift
//  MovieList
//
//  Created by Василий Пронин on 24.01.2022.
//

import Foundation
import UIKit

class MovieDetailsViewController: UIViewController {
    
    @IBOutlet var movieTitleLabel: UILabel!
    
    private var movieDetails: MovieDetails?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData(from: Link1.movieDetails.rawValue)
        
    }
    
    
    @IBAction func ShowTitle() {
        showTitle()
    }
    
    private func fetchData(from url: String?) {
        NetworkManager.shared.fetchData1(from: url) { movieDetails in
            self.movieDetails = movieDetails
        }
    }
    
    private func showTitle() {
        movieTitleLabel.text = movieDetails?.title ?? "nil"
    }
}
