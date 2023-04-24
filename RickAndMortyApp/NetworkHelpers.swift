//
//  NetworkHelpers.swift
//  RickAndMortyApp
//
//  Created by Emincan Antalyalı on 14.04.2023.
//
import Foundation


enum Endpoints: String {
    
    case character = "/character"
    case location = "/location"
    
}

extension Endpoints {
    
   
    
    func pageQuery(pageId: String) -> String{
        return "https://rickandmortyapi.com/api\(self.rawValue)?page=\(pageId)"
    }
    func withQueryBaseUrl(id: String) -> String {
        return "https://rickandmortyapi.com/api\(self.rawValue)/\(id)"
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
