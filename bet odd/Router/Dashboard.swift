//
//  Dashboard.swift
//  bet odd
//
//  Created by Rodrigo Santos on 21/09/20.
//

import SwiftUI

struct Dashboard: View {
    
    @Binding var banca: Banca
    
    @State var router: Router = .home
    
    var body: some View {
        Group {
            switch router {
            case .home:
                Home(router: $router)
            case .winwin:
                WinWin(router: $router)
            case .diversos:
                Diversos(router: $router)
            case .config:
                Config(router: $router)
            }
        }
        .animation(.spring())
    }
}

struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard(banca: .constant(Banca(valorBanca: 0)))
    }
}
 


