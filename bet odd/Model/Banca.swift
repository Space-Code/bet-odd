//
//  Banca.swift
//  bet odd
//
//  Created by Rodrigo Santos on 23/09/20.
//

import Foundation

import Combine

// MARK: - Banca
struct Banca: Codable, Equatable {
    
    var id: Int?
    var valorBanca: Double

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case valorBanca = "valorBanca"
    }
}
