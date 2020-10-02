//
//  BancaStore.swift
//  bet odd
//
//  Created by Rodrigo Santos on 23/09/20.
//

import Foundation
import SwiftUI
import Combine

class BancaStore: ObservableObject {
    
    @Published var banca: String = UserDefaults.standard.string(forKey: "value") ?? "" {
        didSet {
            UserDefaults.standard.set(self.banca, forKey: "value")
        }
    }
    
    func setBanca(banca: Banca, completion: @escaping (Banca) -> ()) {
        BancaNetworking.shared.setBanca(banca) { (banca) in
            completion(banca)
        }
    }
    
    func getBancaById(completion: @escaping (Banca) -> ()) {
        BancaNetworking.shared.getBancaById() { (banca) in
            completion(banca)
        }
    }
    
}
