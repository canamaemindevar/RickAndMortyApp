//
//  Location.swift
//  RickAndMortyApp
//
//  Created by Emincan Antalyalı on 14.04.2023.
//

import Foundation

// MARK: - LocationResponse
struct LocationResponse: Codable {
    let info: LocationInfo?
    let results: [LocationResult]?
}

// MARK: - LocationInfo
struct LocationInfo: Codable {
    let count, pages: Int?
    let next: String?
    let prev: String?
}

// MARK: - LocationResult
struct LocationResult: Codable {
    let id: Int?
    let name, type, dimension: String?
    let residents: [String]?
    let url: String?
    let created: String?
}
