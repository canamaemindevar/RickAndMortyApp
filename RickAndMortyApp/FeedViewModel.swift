//
//  FeedViewModel.swift
//  RickAndMortyApp
//
//  Created by Emincan Antalyalı on 14.04.2023.
//

import Foundation

protocol FeedViewModelInterface {
    var view: FeedViewController? { get set }
    var headercell: CellHeader? {get set}
    func parseCharacter(with id: String , completion: @escaping(ResultCharacter) -> Void )
    func fetchLocationWithQuery(with id: String)
    var currentIndex: Int {get set}
    func viewDidLoad()
}

final class FeedViewModel {
    
    weak var view: FeedViewController?
    weak var headercell: CellHeader?
    
    var locationResponseForCollectionView = [LocationResult]()
    var tableViewCharacterUrlArray = [String]()
    var tableViewCharacterArray = [ResultCharacter]()
      var currentIndex = 1
    init() {
        fetchLocationData()
        fetchLocationWithQuery(with: "1")
    }
    
    deinit {
        print("FeedViewModel deinitialized")
    }
    
    
    func fetchLocationData() {
        NetworkManager.shared.request(type: LocationResponse.self, url: "https://rickandmortyapi.com/api/location", method: .get) { [weak self] response in
            switch response {
            case .success(let success):
                
                if success.info?.count != nil {
                    response.map({ response in
                        
                        guard let data = response.results else {
                            return
                        }
                        
                        self?.headercell?.updateTopCollectionView(with: data)
                    })
                }
            case .failure(let failure):
                print(failure)
            }
        }
    }
}

extension FeedViewModel: FeedViewModelInterface {

    
    
    
    func viewDidLoad() {
        view?.prepare()
        
    }
    
    func fetchLocationWithQuery(with id: String) {
        NetworkManager.shared.request(type: LocationResult.self, url: "https://rickandmortyapi.com/api/location/\(id)", method: .get) { response in
            
            switch response {
            case .success(let success):
                if success.id != nil {
                    guard let data = success.residents else {
                        return
                    }
                    self.view?.updateTableView(chracters: data)
                    //   print(data)
                }
            case .failure(let failure):
                
                print(failure)
            }
        }
    }
    
    
    func parseCharacter(with link: String , completion: @escaping(ResultCharacter) -> Void )  {
        NetworkManager.shared.request(type: ResultCharacter.self, url: link, method: .get) { response in
            
            switch response {
            case .success(let success):
                completion(success)
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    
}



