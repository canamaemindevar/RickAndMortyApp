//
//  ViewController.swift
//  RickAndMortyApp
//
//  Created by Emincan Antalyalı on 14.04.2023.
//

import UIKit




protocol FeedViewControllerInterface: AnyObject {
    
    func prepare()
    func updateTableView(chracters: [String])
}

final class FeedViewController: UIViewController  {
    
    //MARK: - Components
    private lazy var viewModel = FeedViewModel()
    
     let tableView: UITableView = {
        let tableView = UITableView(frame: .zero,style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .systemGray6
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
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: tableView.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
  
    
   
    
}

//MARK: - Tableview funcs


extension FeedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let url = self.viewModel.tableViewCharacterUrlArray[indexPath.row]
        
        self.viewModel.parseCharacter(with: url) {[weak self] response in
            
                let vm = DetailViewModel(data: response)
                let vc = DetailViewController(vm: vm)
                self?.navigationController?.pushViewController(vc, animated: true)
            
          
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
        
       
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(swipeLeft))
        swipeDown.direction = .left
        view.addGestureRecognizer(swipeDown)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(swiperight))
        swipeUp.direction = .right
        view.addGestureRecognizer(swipeUp)
        
        let tableViewHeader = CellHeader(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 100))
        self.tableView.tableHeaderView = tableViewHeader
        
        setupConts()
    }
}


//MARK: - Change Location


extension FeedViewController {
    
    @objc func swipeLeft() {

        if viewModel.currentIndex > 0 && viewModel.currentIndex <= 19 {
            viewModel.currentIndex += 1
            viewModel.fetchLocationWithQuery(with: String(viewModel.currentIndex))
        }
    }
    @objc func swiperight() {

        if viewModel.currentIndex > 1 && viewModel.currentIndex <= 20 {
            viewModel.currentIndex -= 1
            viewModel.fetchLocationWithQuery(with: String(viewModel.currentIndex))
        }
    }
    
}
