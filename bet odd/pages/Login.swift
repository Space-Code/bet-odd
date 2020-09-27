//
//  Home.swift
//  bet odd
//
//  Created by Rodrigo Santos on 20/09/20.
//

import SwiftUI
import AuthenticationServices


var social = ["twitter","fb","google"]

struct Login : View {
    
    
    @Binding var isLogin: Bool
    
    @State var index = 0
    @Namespace var name
    
    var body: some View{
        
        ZStack{
            Color(#colorLiteral(red: 0, green: 0.3290299773, blue: 0.3324583769, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            
            GeometryReader { bounds in
                
                ZStack {
                    Image("pattern")
                        .frame(width: bounds.size.width, alignment: .topTrailing)
                        .edgesIgnoringSafeArea(.top)
                }
                .frame(width: bounds.size.width, height: bounds.size.height, alignment: .top)
                
                VStack {
                    Text("Win Odd")
                        .foregroundColor(.white)
                        .font(.title)
                        .fontWeight(.bold)
                        .offset(x: 0, y: 50.0)
                }
                .frame(width: bounds.size.width, height: bounds.size.height, alignment: .top)
                
                VStack {
                    SignInWithAppleButton(
                        .continue,
                        onRequest: { request in
                            // 1
                            request.requestedScopes = [.fullName, .email]
                        },
                        onCompletion: { result in
                            switch result {
                            case .success ( _):
                                // 2
                                print("Authorization successful.")
                                self.isLogin = true
                            case .failure (let error):
                                // 3
                                print("Authorization failed: " + error.localizedDescription)
                            }
                        }
                    )
                    .frame(width: 300, height: 60)
                }
                .frame(width: bounds.size.width, height: bounds.size.height, alignment: .center)
                .offset(x: 0, y: 20.0)
                
                ZStack {
                    Image("img footer")
                        .resizable()
                        .frame(height: 200, alignment: .center)
                }
                .frame(width: bounds.size.width, height: bounds.size.height + bounds.safeAreaInsets.bottom, alignment: .bottom)
                
                ZStack {
                    Image("person")
                        .offset(x: 80.0, y: -120.0)
                }
                .frame(width: bounds.size.width, height: bounds.size.height + bounds.safeAreaInsets.bottom, alignment: .bottom)
            }
        }
    }
}


struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Login(isLogin: .constant(false))
                .preferredColorScheme(.dark)
        }
    }
}
