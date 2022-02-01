//
//  TrendingCollectionView.swift
//  MovieList
//
//  Created by Василий Пронин on 01.02.2022.
//

import UIKit

class TrendingCollectionView: UICollectionView {
    
    var trendingCells: Trending?

    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        super.init(frame: .zero, collectionViewLayout: layout)
        
        backgroundColor = .green
        
        delegate = self
        dataSource = self
        
        register(TrendingCollectionViewCell.self, forCellWithReuseIdentifier: TrendingCollectionViewCell.reuseID)
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func fetchData(from url: String?) {
        NetworkManager.shared.fetchData(from: Link.trending.rawValue, with: { cells in
            self.trendingCells = cells
        })
    }
}

extension TrendingCollectionView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        trendingCells?.moviesTrending.count ?? 0
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: TrendingCollectionViewCell.reuseID, for: indexPath) as! TrendingCollectionViewCell
        
        let movie = trendingCells?.moviesTrending[indexPath.item]
        cell.configure(with: movie)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 200, height: 200)
    }
    
}
