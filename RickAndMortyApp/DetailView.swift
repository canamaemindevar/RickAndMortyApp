//
//  DetailView.swift
//  RickAndMortyApp
//
//  Created by Emincan Antalyalı on 14.04.2023.
//

import UIKit
import SwiftUI
import SDWebImage

final class DetailViewController: UIViewController {

    let viewmodel: DetailViewModel
    
    //MARK: - Components
    
    private let headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemTeal
        view.layer.cornerRadius = 60
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let footerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemTeal
        view.layer.cornerRadius = 60
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        
        
        iv.clipsToBounds = true
        iv.layer.cornerRadius = iv.bounds.height / 2
        iv.tintColor = .label
        return iv
    }()
    
    private let nameLabel: UILabel = {
        let sView = UILabel()
        sView.translatesAutoresizingMaskIntoConstraints = false
        sView.layer.cornerRadius = 5
        sView.textColor(.systemTeal)
        sView.font(.boldSystemFont(ofSize: 22))
        sView.align(.center)
        return sView
    }()
    
    
    private let stackview: UIStackView = {
        let sView = UIStackView()
        sView.translatesAutoresizingMaskIntoConstraints = false
        sView.layer.cornerRadius = 5
        sView.axis = .vertical
        sView.distribution = .fillEqually
        return sView
    }()
    
    private let statusLabel: UILabel = {
        let sView = UILabel()
        sView.translatesAutoresizingMaskIntoConstraints = false
        sView.layer.cornerRadius = 5
        sView.font(.italicSystemFont(ofSize: 20))
        sView.text = "sdasdasd"
        sView.align(.left)
        return sView
    }()
    private let specyLabel: UILabel = {
        let sView = UILabel()
        sView.translatesAutoresizingMaskIntoConstraints = false
        sView.layer.cornerRadius = 5
        sView.font(.italicSystemFont(ofSize: 20))
        sView.text = "sdasdasd"
        sView.align(.left)
        return sView
    }()
    private let genderLabel: UILabel = {
        let sView = UILabel()
        sView.translatesAutoresizingMaskIntoConstraints = false
        sView.layer.cornerRadius = 5
        sView.font(.italicSystemFont(ofSize: 20))
        sView.text = "sdasdasd"
        sView.align(.left)
        return sView
    }()
    private let originLabel: UILabel = {
        let sView = UILabel()
        sView.translatesAutoresizingMaskIntoConstraints = false
        sView.layer.cornerRadius = 5
        sView.font(.italicSystemFont(ofSize: 20))
        sView.text = "sdasdasd"
        sView.align(.left)
        return sView
    }()
    private let locationLabel: UILabel = {
        let sView = UILabel()
        sView.translatesAutoresizingMaskIntoConstraints = false
        sView.layer.cornerRadius = 5
        sView.font(.italicSystemFont(ofSize: 20))
        sView.text = "sdasdasd"
        sView.align(.left)
        return sView
    }()
    private let episodeLabel: UILabel = {
        let sView = UILabel()
        sView.translatesAutoresizingMaskIntoConstraints = false
        sView.layer.cornerRadius = 5
        sView.font(.italicSystemFont(ofSize: 20))
        sView.text = "sdasdasd"
        sView.align(.left)
        return sView
    }()
    private let createdLabel: UILabel = {
        let sView = UILabel()
        sView.translatesAutoresizingMaskIntoConstraints = false
        sView.layer.cornerRadius = 5
        sView.font(.italicSystemFont(ofSize: 20))
        sView.text = "sdasdasd"
        sView.align(.left)
        return sView
    }()
    
    //MARK: - Life cycle

    init(vm: DetailViewModel) {
       
        self.viewmodel = vm
       
        super.init(nibName: nil, bundle: nil)
        config()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .tertiarySystemFill
        layout()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.tintColor = .systemTeal
    }
    
   
    //MARK: - Func
    
    private func layout() {
        
        let headerviewHeight = view.frame.height / 4
        
        guard let url = viewmodel.data.image else {
            return
        }
        imageView.sd_setImage(with: URL(string: url))
        
        view.addSubview(headerView)
        view.addSubview(nameLabel)
        view.addSubview(footerView)
        view.addSubview(imageView)
        footerView.addSubview(stackview)
        stackview.addArrangedSubview(statusLabel)
        stackview.addArrangedSubview(specyLabel)
        stackview.addArrangedSubview(genderLabel)
        stackview.addArrangedSubview(originLabel)
        stackview.addArrangedSubview(locationLabel)
        stackview.addArrangedSubview(episodeLabel)
        stackview.addArrangedSubview(createdLabel)
        
        imageView.layer.cornerRadius = (headerviewHeight - 20) / 2
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 0),
            nameLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: nameLabel.trailingAnchor, multiplier: 1),
            nameLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
        NSLayoutConstraint.activate([
            headerView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            headerView.topAnchor.constraint(equalToSystemSpacingBelow: nameLabel.bottomAnchor, multiplier: 0),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: headerView.trailingAnchor, multiplier: 1),
            headerView.heightAnchor.constraint(equalToConstant: headerviewHeight),
            headerView.widthAnchor.constraint(equalToConstant: view.frame.width)
        ])
        NSLayoutConstraint.activate([
            footerView.topAnchor.constraint(equalToSystemSpacingBelow: headerView.bottomAnchor, multiplier: 3),
            footerView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: -4),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: footerView.trailingAnchor, multiplier: -4),
            footerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
            
        ])
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            imageView.heightAnchor.constraint(equalToConstant: headerviewHeight - 20),
            imageView.widthAnchor.constraint(equalToConstant: headerviewHeight - 20)
        ])
        
        
        NSLayoutConstraint.activate([
            stackview.leadingAnchor.constraint(equalToSystemSpacingAfter: footerView.leadingAnchor, multiplier: 10),
            stackview.trailingAnchor.constraint(equalToSystemSpacingAfter: footerView.trailingAnchor, multiplier: 1),
            stackview.topAnchor.constraint(equalTo: footerView.topAnchor, constant: 0),
            stackview.bottomAnchor.constraint(equalTo: footerView.bottomAnchor, constant: -20)
        ])
        
        
    }
    
    private func config() {
        
        let date = Date()
        
        let wordToRemove = "https://rickandmortyapi.com/api/episode/"
        self.nameLabel.text =  viewmodel.data.name
       
        self.statusLabel.text = "Status:" + "          " + (viewmodel.data.status?.rawValue ?? "")
        self.specyLabel.text = "Specy:" + "          " + (viewmodel.data.species?.rawValue ?? "")
        self.genderLabel.text = "Gender:" + "        " + (viewmodel.data.gender?.rawValue ?? "")
        self.originLabel.text = "Origin:" + "          " + (viewmodel.data.origin?.name ?? "")
        self.locationLabel.text = "Location:" + "       " + (viewmodel.data.location?.name ?? "")
        self.episodeLabel.text = "Episodes:" + "      " + (viewmodel.data.episode?.map{ $0.replacingOccurrences(of: wordToRemove, with: "") }.joined(separator: ",") ?? "")
        self.createdLabel.text = "Created at:" + "    " + date.getFormattedDate(format: viewmodel.data.created ?? "")
    }

    

    
    
 

}


//@available(iOS 13, *)
//extension UIViewController {
//    private struct Preview: UIViewControllerRepresentable {
//        //var is used for injecting the current view controller
//        let viewController: UIViewController
//
//        func makeUIViewController(context: Context) -> UIViewController {
//            return viewController
//        }
//        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
//    }
//
//    func toPreview() -> some View {
//        Preview(viewController: self)
//    }
//}
//
//
//struct SwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailViewController().toPreview()
//    }
//}
