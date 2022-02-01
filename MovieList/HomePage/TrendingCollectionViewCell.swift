//
//  TrendingCollectionViewCell.swift
//  MovieList
//
//  Created by Василий Пронин on 01.02.2022.
//

import UIKit

class TrendingCollectionViewCell: UICollectionViewCell {
    
    static let reuseID = "TrendingCollectionViewCell"
    
//    let posterImageView: UIImageView = {
//        let posterView = UIImageView()
//        posterView.backgroundColor = .blue
//        posterView.translatesAutoresizingMaskIntoConstraints = false
//        return posterView
//    }()
    
    let posterImage = UIImageView()
    
    let title = UILabel()
    
    private var spinnerView = UIActivityIndicatorView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        posterImage.layer.cornerRadius = 10
        posterImage.clipsToBounds = true
        posterImage.contentMode = .scaleAspectFit
        
        title.numberOfLines = 0
//
//        addSubview(posterImageView)
//
//        posterImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
//        posterImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
//        posterImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
//        posterImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        let stackView = UIStackView(arrangedSubviews: [posterImage, title])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func configure(with moviesTrending: MoviesTrending?) {
        title.text = moviesTrending?.title ?? ""
        DispatchQueue.global().async {
            guard let imageURL = URL(string: moviesTrending?.posterPath ?? "") else { return }
            guard let imageData = try? Data(contentsOf: imageURL) else { return }
            DispatchQueue.main.async {
                self.posterImage.image = UIImage(data: imageData)
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
