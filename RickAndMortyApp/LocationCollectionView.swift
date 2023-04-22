//
//  LocationCollectionView.swift
//  RickAndMortyApp
//
//  Created by Emincan Antalyalı on 14.04.2023.
//

import UIKit

final class LocationCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "locationCell"
    
    
    private let label: UILabel = {
        let label = UILabel()
        label.resizable()
        label.numberOfLines = 0
        label.font(.preferredFont(forTextStyle: .body).withSize(22))
        label.align(.center)
        label.backgroundColor = .clear
        label.textColor(.label)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .magenta
        setConts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConts(){
        contentView.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            trailingAnchor.constraint(equalTo: label.trailingAnchor),
            label.topAnchor.constraint(equalTo: topAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        self.layer.cornerRadius = 20
        
    }

    
    
    public func configure(_ text: String) {
        label.text(text)
        label.layer.cornerRadius = 20
    }
    
    
}
