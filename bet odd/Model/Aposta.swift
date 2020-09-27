//
//  Aposta.swift
//  bet odd
//
//  Created by Rodrigo Santos on 25/09/20.
//

import Foundation

import Combine

// MARK: - Aposta
struct Aposta: Codable, Equatable {
    
    var id: Int
    var tag: String
    var totalInvestido: Int

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case tag = "tag"
        case totalInvestido = "totalInvestido"
    }
}
