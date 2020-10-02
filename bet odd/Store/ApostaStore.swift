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
    
    func getApostaWinWin(completion: @escaping ([Aposta]) -> ()) {
        ApostaNetworking.shared.getApostaWinWin() { (aposta) in
            completion(aposta)
        }
    }
    
    func getApostaDiversos(completion: @escaping ([Aposta]) -> ()) {
        ApostaNetworking.shared.getApostaDiversos() { (aposta) in
            completion(aposta)
        }
    }
    
    func setApostaWinWin(aposta: Aposta, completion: @escaping (Aposta) -> ()) {
        ApostaNetworking.shared.setApostaWinWin(aposta) { (aposta) in
            completion(aposta)
        }
    }
    
    func setApostaDiversos(aposta: Aposta, completion: @escaping (Aposta) -> ()) {
        ApostaNetworking.shared.setApostaDiversos(aposta) { (aposta) in
            completion(aposta)
        }
    }
    
}
