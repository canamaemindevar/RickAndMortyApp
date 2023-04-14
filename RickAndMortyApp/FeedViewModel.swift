//
//  FeedViewModel.swift
//  RickAndMortyApp
//
//  Created by Emincan Antalyalı on 14.04.2023.
//

import Foundation

//protocol ChooseLocation {
//    func fetchLocationWithQuery(with id: String)
//}


protocol FeedViewModelInterface {
    var view: FeedViewController? { get set }
    
    func viewDidLoad()
}

final class FeedViewModel {
    
    weak var view: FeedViewController?
   //  var cellHeaderInterface: CellHeaderInterface?
    
    let headerView = CellHeader()
    var locationResponseForCollectionView = [LocationResult]()
    var tableviewDataArrya:  [String]?
    init() {
        fetchLocationData()
    //    headerView.queryDelegate = self
       
    }
    
    deinit {
        print("FeedViewModel deinitialized")
    }
    
    
    func fetchLocationData() {
        NetworkManager.shared.request(type: LocationResponse.self, url: "https://rickandmortyapi.com/api/location", method: .get) { response in
            switch response {
            case .success(let success):
                
                if success.info?.count != nil {
                    response.map({ response in
                       
                        guard let data = response.results else {
                            return
                        }
                        
                        self.locationResponseForCollectionView = data
                    //    self.reloadCollection?.updateCollection()
                        print(response)
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
      //  view?.setupConts()
        view?.prepare()
        
    }
    
    
}

//MARK: - query

//extension FeedViewModel: ChooseLocation {
//    func fetchLocationWithQuery(with id: String) {
//        NetworkManager.shared.request(type: LocationResult.self, url: "https://rickandmortyapi.com/api/location/\(id)", method: .get) { response in
//
//            switch response {
//            case .success(let success):
//                if success.id != nil {
//                    guard let data = success.residents else {
//                        return
//                    }
//                  //  self.view?.updateMainCollectionView(chracters: data)
//
//                    print(data)
//                }
//            case .failure(let failure):
//                print(failure)
//            }
//
//
//        }
//    }
//}
