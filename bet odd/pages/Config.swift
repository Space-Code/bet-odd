//
//  Config.swift
//  bet odd
//
//  Created by Rodrigo Santos on 24/09/20.
//

import SwiftUI

struct Config: View {
    
    @ObservedObject var data = WinState()
    
    @Binding var router: Router
    
    var body: some View {
        ZStack{
            Color(#colorLiteral(red: 0, green: 0.262745098, blue: 0.262745098, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            
            GeometryReader { bounds in
                
                ZStack {
                    Image("pattern")
                        .frame(width: bounds.size.width, alignment: .topTrailing)
                        .edgesIgnoringSafeArea(.top)
                }
                .frame(width: bounds.size.width, height: bounds.size.height, alignment: .top)
                
                VStack {
                    Button(action: { router = .home }) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 30))
                    }
                    .padding(.horizontal, 20)
                    .animation(.spring())
                }
                .frame(width: bounds.size.width, height: 50, alignment: .topLeading)
                .offset(x: 0, y: 20.0)
                
                VStack {
                    VStack(alignment: .leading) {
                        Text("Usuario:")
                            .foregroundColor(.white)
                            .font(.subheadline)
                        
                        Text("Rodrigo Santos de Souza")
                            .foregroundColor(.white)
                            .font(.title2)
                    }
                    .padding(.horizontal, 20)
                }
                .frame(width: bounds.size.width, height: 50, alignment: .topLeading)
                .offset(x: 0, y: 70.0)
                
                ZStack {
                    Color(.white)
                }
                .frame(width: bounds.size.width, height: bounds.size.height + bounds.safeAreaInsets.bottom - 160, alignment: .top)
                .background(Color(#colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)))
                .cornerRadius(12)
                .offset(x: 0, y: 160.0)
                .edgesIgnoringSafeArea(.bottom)
                
            }
        }
    }
}

struct Config_Previews: PreviewProvider {
    static var previews: some View {
        Config(router: .constant(.config))
    }
}
