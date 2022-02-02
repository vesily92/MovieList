//
//  HomePageViewController.swift
//  MovieList
//
//  Created by Василий Пронин on 01.02.2022.
//

import UIKit

class HomePageViewController: UIViewController {

    let sectionTitle = UILabel()
    
    var trendingCollectionView = TrendingCollectionView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(trendingCollectionView)
        view.addSubview(sectionTitle)
        sectionTitle.text = "Trending"
        
//        let stackView = UIStackView(arrangedSubviews: [sectionTitle, trendingCollectionView])
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.axis = .vertical
//        stackView.alignment = .leading
//
//        NSLayoutConstraint.activate([
//            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            stackView.topAnchor.constraint(equalTo: view.topAnchor),
//            stackView.heightAnchor.constraint(equalToConstant: 350)
//        ])
        NSLayoutConstraint.activate([
            sectionTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            sectionTitle.topAnchor.constraint(equalTo: view.topAnchor),
            sectionTitle.bottomAnchor.constraint(equalTo: trendingCollectionView.topAnchor, constant: 20),
            
            trendingCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            trendingCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            trendingCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            trendingCollectionView.heightAnchor.constraint(equalToConstant: 350)
        ])
        
        trendingCollectionView.fetchData(from: Link.trending.rawValue)
        
    }
    
    func setup() {
        sectionTitle.text = "Trending"
    }
    
    
}
