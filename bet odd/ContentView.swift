//
//  ContentView.swift
//  bet odd
//
//  Created by Rodrigo Santos on 20/09/20.
//

import SwiftUI

struct ContentView: View {
    
    @State var isLogin: Bool = false
    @State var isBanca: Bool = true
    
    
    @State var banca: Banca = Banca(valorBanca: 0)
    
    var body: some View {
        // For Smaller Size iPhones...
        
        Group {
            if !isLogin {
                VStack{
                    
                    if UIScreen.main.bounds.height < 750{
                        
                        ScrollView(.vertical, showsIndicators: false) {
                            Login(isLogin: $isLogin)
                        }
                    }
                    else{
                        Login(isLogin: $isLogin)
                            
                    }
                }
                .padding(.vertical)
                .edgesIgnoringSafeArea(.all)
            } else {
                if isBanca {
                    BancaView(isBanca: $isBanca, banca: $banca)
                        .environmentObject(BancaStore())
                } else {
                    Dashboard(banca: $banca)
                }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(banca: Banca(valorBanca: 3000))
    }
}
