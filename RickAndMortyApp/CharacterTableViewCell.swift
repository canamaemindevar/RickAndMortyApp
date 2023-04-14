//
//  CharacterTableViewVell.swift
//  RickAndMortyApp
//
//  Created by Emincan Antalyalı on 14.04.2023.
//

import UIKit

final class CharacterTableViewCell: UITableViewCell {
    
   

   static let identifier = "characterCell"
    
    private let maleimageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = .checkmark
        iv.contentMode = .scaleAspectFit
        iv.tintColor = .label
        return iv
    }()
    private let femaleimageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = .checkmark
        iv.contentMode = .scaleAspectFit
        iv.tintColor = .label
        return iv
    }()
    private let genderlessimageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = .checkmark
        iv.contentMode = .scaleAspectFit
        iv.tintColor = .label
        return iv
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .brown
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    public func config(data: ResultCharacter) {
        
        switch data.gender {
        case .some(.female):
            maleimageView.isHidden = true
            genderlessimageView.isHidden = true
            // sd Web image
          //  femaleimageView.image = data.imag
        case .none:
            break
        case .some(.male):
            femaleimageView.isHidden = true
            genderlessimageView.isHidden = true
            // sd Web image
          //  femaleimageView.image = data.imag
        case .some(.unknown):
            femaleimageView.isHidden = true
            maleimageView.isHidden = true
            // sd Web image
          //  femaleimageView.image = data.imag
        }
        
        
    }
    
    
    
    
    

}

