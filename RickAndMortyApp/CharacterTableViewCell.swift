//
//  CharacterTableViewVell.swift
//  RickAndMortyApp
//
//  Created by Emincan Antalyalı on 14.04.2023.
//

import UIKit
import SDWebImage

final class CharacterTableViewCell: UITableViewCell {
    
   

   static let identifier = "characterCell"
    
    private let maleimageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.tintColor = .label
        iv.layer.cornerRadius = 5
        return iv
    }()
    private let femaleimageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.tintColor = .label
        iv.layer.cornerRadius = 5
        return iv
    }()
    private let genderlessimageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.tintColor = .label
        iv.layer.cornerRadius = 5
        return iv
    }()
    
    private let stackview: UIStackView = {
        let sView = UIStackView()
        sView.translatesAutoresizingMaskIntoConstraints = false
        sView.layer.cornerRadius = 5
        sView.axis = .horizontal
        sView.distribution = .fillEqually
        return sView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        translatesAutoresizingMaskIntoConstraints = false
        setupConts()
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    private func setupConts() {
        contentView.addSubview(stackview)
        stackview.addArrangedSubview(femaleimageView)
        stackview.addArrangedSubview(genderlessimageView)
        stackview.addArrangedSubview(maleimageView)
        
        NSLayoutConstraint.activate([

            stackview.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        stackview.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            stackview.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 10),
            stackview.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width )
        ])
    }

    
    
    public func config(data: ResultCharacter) {
        
        guard let url = data.image else {
            return
        }
       
        
        DispatchQueue.main.async { [weak self] in
            
            guard let self = self  else {
                return
            }
            switch data.gender {
            case .some(.female):
                maleimageView.image = nil
                genderlessimageView.image = nil
                maleimageView.backgroundColor = .systemPurple
                genderlessimageView.backgroundColor = .systemPurple
                contentView.backgroundColor = .systemPurple
                //TODO: sd Web image
                femaleimageView.sd_setImage(with: URL(string: url) )
            case .none:
                break
            case .some(.male):
                femaleimageView.image = nil
                genderlessimageView.image = nil
                femaleimageView.backgroundColor = .darkGray
                genderlessimageView.backgroundColor = .darkGray
                contentView.backgroundColor = .darkGray
                //TODO: sd Web image
                maleimageView.sd_setImage(with: URL(string: url) )
            case .some(.unknown), .some(.genderless):
                femaleimageView.image = nil
                maleimageView.image = nil
                femaleimageView.backgroundColor = .link
                maleimageView.backgroundColor = .link
                contentView.backgroundColor = .link
                //TODO: sd Web image
              genderlessimageView.sd_setImage(with: URL(string: url) )
          
            }
        }
        
        
    }
    
    
    
    
    

}

