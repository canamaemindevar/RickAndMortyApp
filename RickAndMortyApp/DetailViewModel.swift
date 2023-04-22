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

//extension DetailViewModel: ChracterParsable {
//    func parseCharacter(with link: String , completion: @escaping(ResultCharacter) -> Void )  {
//        NetworkManager.shared.request(type: ResultCharacter.self, url: link, method: .get) { response in
//            
//            switch response {
//            case .success(let success):
//                completion(success)
//            case .failure(let failure):
//                print(failure)
//            }
//        }
//    }
//}

