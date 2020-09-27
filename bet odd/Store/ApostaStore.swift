//
//  AuthenticationStore.swift
//  bet odd
//
//  Created by Rodrigo Santos on 24/09/20.
//

import Foundation
import SwiftUI
import Combine


class ApostaStore: ObservableObject {
    
    
    func setAposta(aposta: Aposta, completion: @escaping (Aposta) -> ()) {
        ApostaNetworking.shared.setAposta(aposta) { (aposta) in
            completion(aposta)
        }
    }
    
}
