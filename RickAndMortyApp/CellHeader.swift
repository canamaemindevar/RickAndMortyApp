//
//  CellHeader.swift
//  RickAndMortyApp
//
//  Created by Emincan Antalyalı on 14.04.2023.
//

import UIKit

protocol CellHeaderInterface: AnyObject {
    func updateTopCollectionView(with: [LocationResult])
}


final class CellHeader: UIView {
    
    static let identifier = "HeaderCell"
    
    lazy var viewModel = FeedViewModel()
    
   
    
    let segmentControlCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let size = UIScreen.main.bounds.width
        layout.itemSize = .init(width: size/3, height: 80)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.layer.cornerRadius = 5
        collection.backgroundColor = .cyan
        collection.register(LocationCollectionViewCell.self, forCellWithReuseIdentifier: LocationCollectionViewCell.identifier)
        
        return collection
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        viewModel.headercell = self
        setupUI()
        backgroundColor = .white
        
     
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
     func setupUI() {
        
       
        segmentControlCollectionView.delegate = self
        segmentControlCollectionView.dataSource = self
        self.addSubview(segmentControlCollectionView)
        self.segmentControlCollectionView.frame = bounds
     
        
    }
    
    
  
}

extension CellHeader: CellHeaderInterface {
    func updateTopCollectionView(with array: [LocationResult]) {
        viewModel.locationResponseForCollectionView = array
        
        DispatchQueue.main.async {
            self.segmentControlCollectionView.reloadData()
        }
    }
    
    
    
}


    
    
//}

extension CellHeader: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let arr = viewModel.locationResponseForCollectionView
        guard let query = arr[indexPath.item].id else {
            return
        }
       // print(query)
        viewModel.fetchLocationWithQuery(with: String(query))
        
    }
    
    
}

extension CellHeader: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
        viewModel.locationResponseForCollectionView.count
        
      
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LocationCollectionViewCell.identifier, for: indexPath) as? LocationCollectionViewCell else {
            return UICollectionViewCell()
        }


        cell.configure(viewModel.locationResponseForCollectionView[indexPath.item].name ?? "nil")

        
        return cell
    }
    

}


//MARK: -Protocols


/*
 
 protocol CellHeaderInterface {
     func updateSegmentController(response: [LocationResult])
 }

 
 
 
 
 
 
 
 
 
 */
