//
//  ViewRouter.swift
//  bet odd
//
//  Created by Rodrigo Santos on 01/10/20.
//

import SwiftUI

class ViewRouter: ObservableObject {

    init() {
        if !UserDefaults.standard.bool(forKey: "didLaunchBefore") {
            UserDefaults.standard.set(true, forKey: "didLaunchBefore")
            currentPage = "banca"
        } else {
            currentPage = "dashboard"
        }
    }
    
    @Published var currentPage: String
}
