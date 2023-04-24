//
//  ViewController.swift
//  RickAndMortyApp
//
//  Created by Emincan Antalyalı on 14.04.2023.
//

import UIKit

protocol CellHeaderInterface: AnyObject {
    func updateTopCollectionView(with: [LocationResult])
}


protocol FeedViewControllerInterface: AnyObject {
    
    func prepare()
    func updateTableView(chracters: [String])
}

final class FeedViewController: UIViewController  {
    
    //MARK: - Components
    private lazy var viewModel = FeedViewModel()
    
    
    let segmentControlCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let size = UIScreen.main.bounds.width
        layout.itemSize = .init(width: size/3, height: 80)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.layer.cornerRadius = 5
        collection.backgroundColor = .systemTeal
        collection.register(LocationCollectionViewCell.self, forCellWithReuseIdentifier: LocationCollectionViewCell.identifier)
        
        return collection
    }()
    
    
     let tableView: UITableView = {
        let tableView = UITableView(frame: .zero,style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.separatorColor = .systemCyan
        tableView.register(CharacterTableViewCell.self, forCellReuseIdentifier: CharacterTableViewCell.identifier)
        tableView.layer.cornerRadius = 40
        return tableView
    }()
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()
    }
    
    private func setupConts() {
        
        
        NSLayoutConstraint.activate([
            segmentControlCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: segmentControlCollectionView.trailingAnchor),
            segmentControlCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            segmentControlCollectionView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: segmentControlCollectionView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: segmentControlCollectionView.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: segmentControlCollectionView.bottomAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
  
    
   
    
}

//MARK: - Tableview funcs


extension FeedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let url = self.viewModel.tableViewCharacterUrlArray[indexPath.row]
        
        self.viewModel.parseCharacter(with: url) {[weak self] response in
            
            DispatchQueue.main.async {
                let vm = DetailViewModel(data: response)
                let vc = DetailViewController(vm: vm)
                self?.navigationController?.pushViewController(vc, animated: true)
            
            }
                
          
    }

    }
}


extension FeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.tableViewCharacterUrlArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CharacterTableViewCell.identifier, for: indexPath) as? CharacterTableViewCell else {
            return UITableViewCell()
        }
      //  cell.textLabel?.text = self.viewModel.tableViewCharacterUrlArray[indexPath.row]
        let url = self.viewModel.tableViewCharacterUrlArray[indexPath.row]
        self.viewModel.parseCharacter(with: url) {response in
            cell.config(data: response)
        }
        cell.layer.cornerRadius = 100
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height / 5
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
}

//MARK: - Setup

extension FeedViewController: FeedViewControllerInterface {
   
    
    func updateTableView(chracters: [String]) {
        viewModel.tableViewCharacterUrlArray = chracters
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    
    func prepare() {
        
        segmentControlCollectionView.delegate = self
        segmentControlCollectionView.dataSource = self
       
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.backgroundColor = .systemTeal
        view.addSubview(tableView)
        view.addSubview(segmentControlCollectionView)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(swipeLeft))
        swipeDown.direction = .left
        view.addGestureRecognizer(swipeDown)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(swiperight))
        swipeUp.direction = .right
        view.addGestureRecognizer(swipeUp)
        
        setupConts()
    }
}




//MARK: - Change Location


extension FeedViewController {
    
    @objc func swipeLeft() {

        if viewModel.currentLocationIndex > 0 && viewModel.currentLocationIndex <= 19 {
            viewModel.currentLocationIndex += 1
            viewModel.fetchLocationWithQuery(with: String(viewModel.currentLocationIndex))
        }
    }
    @objc func swiperight() {

        if viewModel.currentLocationIndex > 1 && viewModel.currentLocationIndex <= 20 {
            viewModel.currentLocationIndex -= 1
            viewModel.fetchLocationWithQuery(with: String(viewModel.currentLocationIndex))
        }
    }
    
}


//MARK: COllectionView

extension FeedViewController: CellHeaderInterface {
    func updateTopCollectionView(with: [LocationResult]) {
        viewModel.locationResponseForCollectionView.append(contentsOf: with)
        DispatchQueue.main.async {
            self.segmentControlCollectionView.reloadData()
            print(self.viewModel.locationResponseForCollectionView.count)
        }
    }
    
    
}

extension FeedViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let arr = viewModel.locationResponseForCollectionView
        guard let query = arr[indexPath.item].id else {
            return
        }

        viewModel.currentLocationIndex = query
        print(viewModel.currentLocationIndex)

        viewModel.fetchLocationWithQuery(with: String(query))

    }
}

extension FeedViewController: UICollectionViewDataSource {
    
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
    
    public func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.isLastRow(at: collectionView) {
            viewModel.fetchLocationPageWithQuery(id: viewModel.currentLocationPageIndex + 1)
        }
    }
}

