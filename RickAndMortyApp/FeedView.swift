//
//  ViewController.swift
//  RickAndMortyApp
//
//  Created by Emincan Antalyalı on 14.04.2023.
//

import UIKit

protocol FeedViewControllerInterface {
    
    func prepare()
    func updateTableView(chracters: [String])
}



final class FeedViewController: UIViewController  {
    
    
    
    
    //MARK: - Components
    private lazy var viewModel = FeedViewModel()
    
    
    
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero,style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .systemBackground
        tableView.separatorColor = .systemGray
        tableView.register(CharacterTableViewCell.self, forCellReuseIdentifier: CharacterTableViewCell.identifier)
        tableView.layer.cornerRadius = 0
        
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
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: tableView.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    
    
    
    
    func updateMainCollectionView(chracters: [String]) {
        self.viewModel.tableviewDataArrya = chracters
        
        DispatchQueue.main.async {
            
            self.tableView.reloadData()
        }
    }
    
}

//MARK: - Tableview funcs


extension FeedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let viewmodel = DetailViewModel(data: [indexPath.item])
//        let detailVc = DetailViewController()
    
    }
}


extension FeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.tableviewDataArrya?.count ?? 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CharacterTableViewCell.identifier, for: indexPath) as? CharacterTableViewCell else {
            return UITableViewCell()
        }
        
        cell.textLabel?.text = viewModel.tableviewDataArrya?[indexPath.row]
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height / 7
    }
    
    
    
}



//MARK: - Setup

extension FeedViewController: FeedViewControllerInterface {
    func updateTableView(chracters: [String]) {
        viewModel.tableviewDataArrya = chracters
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    
    
    
    func prepare() {
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.backgroundColor = .yellow
        view.addSubview(tableView)
        
        
        let tableViewHeader = CellHeader(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 100))
        self.tableView.tableHeaderView = tableViewHeader
        
        setupConts()
    }
    
    
}


