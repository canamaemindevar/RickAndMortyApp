//
//  NetworkManager.swift
//  RickAndMortyApp
//
//  Created by Emincan Antalyalı on 14.04.2023.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    
    func request<T: Codable>(type: T.Type,url: String, method: HttpMethods,parametres: [String: Any]? = nil,completion: @escaping((Result<T,ErrosTypes>)->())) {
        
        
        let session = URLSession.shared
        guard let url = URL(string: url) else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
//        guard let param  = (try? JSONSerialization.data(withJSONObject: parametres, options: .fragmentsAllowed)) else {
//            return
//        }
//        request.httpBody = param
        
        
        
        let dataTask = session.dataTask(with: request) { data, respone, error in
            
            if let _ = error {
                completion(.failure(.noData))
            } else  if let data = data{
                // handle  func
                
                self.handleResponse(data: data) { response in
                    // present or interact data
                    completion(response)
                }
                
            } else {
                completion(.failure(.invalidUrl))
            }
            
            
        }.resume()
        
    }
    
    
    //MARK:  Handle func
    
    fileprivate func handleResponse<T: Codable>(data: Data, compeltion: @escaping( (Result<T,ErrosTypes>)-> () ) ) {
        
        do {
            let succesData =  try JSONDecoder().decode(T.self, from: data)
            compeltion(.success(succesData))
        } catch  {
            print(error)
            compeltion(.failure(.parsingError))
        }
        
    }
}
