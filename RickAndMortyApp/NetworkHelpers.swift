//
//  NetworkHelpers.swift
//  RickAndMortyApp
//
//  Created by Emincan Antalyalı on 14.04.2023.
//
import Foundation


enum Endpoints: String {
    
    case character = "/character"
  //  case sendData = "/postapi.php"
    
}

extension Endpoints {
    
   
    
    func withBaseUrl() -> String{
        return "https://rickandmortyapi.com/api\(self.rawValue)"
    }
}

enum ErrosTypes: String, Error {
    
    case invalidUrl = "InvalidUrl"
    case noData = "No data"
    case invalidRequest = "Invalid request"
    case generalError = "General Error"
    case parsingError = "Parsing Error"
    

}

enum HttpMethods: String {
    case get = "GET"
    case post = "POST"
}
