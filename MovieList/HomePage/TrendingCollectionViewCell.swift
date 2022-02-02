//
//  TrendingCollectionViewCell.swift
//  MovieList
//
//  Created by Василий Пронин on 01.02.2022.
//

import UIKit

class TrendingCollectionViewCell: UICollectionViewCell {
    
    static let reuseID = "TrendingCollectionViewCell"
    
    let posterImage = UIImageView()
    
    let title = UILabel()
    
//    private var spinnerView = UIActivityIndicatorView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        posterImage.contentMode = .scaleAspectFit
        posterImage.clipsToBounds = true
        posterImage.layer.cornerRadius = 5
        posterImage.backgroundColor = .systemBackground
        
        
        title.numberOfLines = 0

        let stackView = UIStackView(arrangedSubviews: [posterImage, title])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical

        contentView.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.heightAnchor.constraint(greaterThanOrEqualTo: contentView.heightAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            title.widthAnchor.constraint(equalTo: posterImage.widthAnchor, multiplier: 1)
        ])
        
        stackView.setCustomSpacing(10, after: posterImage)
    }
    
    func configure(with moviesTrending: MoviesTrending?) {
        title.text = moviesTrending?.title

        DispatchQueue.global().async {
            let link = Link.image.rawValue
            let size = ImageSize.medium.rawValue
            guard let imagePath = moviesTrending?.posterPath else { return }
            let url = link + size + imagePath
            guard let imageURL = URL(string: url) else { return }
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
