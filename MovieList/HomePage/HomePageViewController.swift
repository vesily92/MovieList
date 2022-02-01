//
//  HomePageViewController.swift
//  MovieList
//
//  Created by Василий Пронин on 01.02.2022.
//

import UIKit

class HomePageViewController: UIViewController {

    var trendingCollectionView = TrendingCollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(trendingCollectionView)
        
        trendingCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        trendingCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        trendingCollectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        trendingCollectionView.heightAnchor.constraint(equalToConstant: 350).isActive = true
        
        trendingCollectionView.fetchData(from: Link.trending.rawValue)
        
        
    }
    
    
    
}
