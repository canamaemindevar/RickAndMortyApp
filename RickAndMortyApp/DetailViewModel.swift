//
//  DetailViewModel.swift
//  RickAndMortyApp
//
//  Created by Emincan Antalyalı on 14.04.2023.
//

import Foundation

final class DetailViewModel{
    
    var data: ResultCharacter

    init(data: ResultCharacter) {
        self.data = data
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


