//
//  Boss.swift
//  TechTest
//
//  Created by Jacob Bartlett on 14/11/2024.
//

import Foundation

struct Boss: Codable, Identifiable, Hashable {
    
    var id: String { name }
    
    let name: String
    let location: String
    let health: Int
    let description: String
    let imageURL: URL
}
