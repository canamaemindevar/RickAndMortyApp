//
//  SomeViewController.swift
//  RickAndMortyApp
//
//  Created by Emincan Antalyalı on 14.04.2023.
//

import SwiftUI

protocol WelcomeHelloViewControllerInterface: AnyObject {
    func rootToFeedView()
}

class WelcomeHelloViewController: UIViewController {
    
    weak var delegate: WelcomeHelloViewControllerInterface?
    
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.tintColor = .label
        return iv
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        decideView()
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.heightAnchor.constraint(equalToConstant: view.frame.height/2),
            imageView.widthAnchor.constraint(equalToConstant: view.frame.width/2)
        ])
        
        
        
        
        let seconds = 3.0
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            self.delegate?.rootToFeedView()
        }
    }
    
    func decideView() {
        if LocalState.hasOnboarded == false {
            
            view.backgroundColor = .systemBackground
            imageView.image = UIImage.gifImageWithName("greeting-1279_512")
        } else {
            
            view.backgroundColor = .systemBackground
            imageView.image = UIImage.gifImageWithName("hello-3141_512")
        
        }
        
    }
    

}


@available(iOS 13, *)
extension UIViewController {
    private struct Preview: UIViewControllerRepresentable {
        //var is used for injecting the current view controller
        let viewController: UIViewController
        
        func makeUIViewController(context: Context) -> UIViewController {
            return viewController
        }
        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
    }
    
    func toPreview() -> some View {
        Preview(viewController: self)
    }
}


struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeHelloViewController().toPreview()
    }
}
