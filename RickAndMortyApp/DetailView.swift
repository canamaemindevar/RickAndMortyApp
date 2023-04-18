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

    let vm: DetailViewModel
    
    init(vm: DetailViewModel) {
        self.vm = vm
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .tertiarySystemFill
        // Do any additional setup after loading the view.
      //  print(vm.data)
        layout()
    }
    
    private let headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.layer.cornerRadius = 60
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let footerView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
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
    
    
    
    
    private let stackview: UIStackView = {
        let sView = UIStackView()
        sView.translatesAutoresizingMaskIntoConstraints = false
        sView.layer.cornerRadius = 5
        sView.axis = .vertical
        sView.distribution = .fillEqually
        return sView
    }()
    
    private let infoLabel: UILabel = {
        let sView = UILabel()
        sView.translatesAutoresizingMaskIntoConstraints = false
        sView.layer.cornerRadius = 5
        sView.font(.italicSystemFont(ofSize: 20))
        sView.text = "sdasdasd"
        sView.align(.center)
        return sView
    }()
    private let nameLabel: UILabel = {
        let sView = UILabel()
        sView.translatesAutoresizingMaskIntoConstraints = false
        sView.layer.cornerRadius = 5
        sView.font(.italicSystemFont(ofSize: 20))
        sView.text = "sdasdasd"
        sView.align(.center)
        return sView
    }()
    
    
    private func layout() {
        
        let headerviewHeight = view.frame.height / 3
        
        guard let url = vm.data.image else {
            return
        }
        imageView.sd_setImage(with: URL(string: url))
        
        view.addSubview(headerView)
        view.addSubview(footerView)
        view.addSubview(imageView)
        footerView.addSubview(stackview)
        stackview.addArrangedSubview(infoLabel)
        stackview.addArrangedSubview(nameLabel)
        
        imageView.layer.cornerRadius = (headerviewHeight - 20) / 2
        NSLayoutConstraint.activate([
            headerView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            headerView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: headerView.trailingAnchor, multiplier: 1),
            headerView.heightAnchor.constraint(equalToConstant: headerviewHeight),
            headerView.widthAnchor.constraint(equalToConstant: view.frame.width)
        ])
        NSLayoutConstraint.activate([
            footerView.topAnchor.constraint(equalToSystemSpacingBelow: headerView.bottomAnchor, multiplier: 3),
            footerView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: -4),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: footerView.trailingAnchor, multiplier: -4),
            footerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 50)
            
        ])
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            imageView.heightAnchor.constraint(equalToConstant: headerviewHeight - 20),
            imageView.widthAnchor.constraint(equalToConstant: headerviewHeight - 20)
        ])
        
        
        NSLayoutConstraint.activate([
            stackview.centerYAnchor.constraint(equalTo: footerView.centerYAnchor),
            stackview.centerXAnchor.constraint(equalTo: footerView.centerXAnchor),
            stackview.widthAnchor.constraint(equalTo: footerView.widthAnchor),
            stackview.heightAnchor.constraint(equalTo: footerView.heightAnchor )
        ])
        
        
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
