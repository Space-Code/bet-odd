//
//  Home.swift
//  bet odd
//
//  Created by Rodrigo Santos on 20/09/20.
//

import SwiftUI
import AuthenticationServices


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
                    Text("Bet Odd")
                        .foregroundColor(.white)
                        .font(.title)
                        .fontWeight(.bold)
                        .offset(x: 0, y: 50.0)
                }
                .frame(width: bounds.size.width, height: bounds.size.height, alignment: .top)
                
                ZStack {
                    
                    VStack {
                        HStack {
                            Spacer()
                            
                            Image(systemName: "chart.bar.fill")
                                .font(.system(size: 30))
                                .foregroundColor(.black)
                                .opacity(0.8)
                            Text("Win ou Win")
                                .foregroundColor(.black)
                                .opacity(0.8)
                            
                            Spacer()
                            
                            Image(systemName: "chart.pie.fill")
                                .font(.system(size: 35))
                                .foregroundColor(.black)
                                .opacity(0.8)
                            Text("Diversos")
                                .foregroundColor(.black)
                                .opacity(0.8)
                            
                            Spacer()
                        }
                    }
                    .padding()
                    .frame(width: bounds.size.width - 40, height: 100,  alignment: .center)
                    .background(Color(#colorLiteral(red: 0.4666666667, green: 0.9019607843, blue: 0.7137254902, alpha: 1)))
                    .cornerRadius(12.0)
                    .offset(x: 0, y: -180.0)
                    
                    VStack {
                        GeometryReader { card in
                            VStack {
                                Text("Trader esportivo")
                                    .foregroundColor(.black)
                                    .font(.title2)
                                    .fontWeight(.bold)
                            }
                            .padding()
                            .frame(width: card.size.width, height: card.size.height,  alignment: .top)
                            
                            VStack {
                                Text("Trader esportivo, em poucas palavras, é quem investe na bolsa esportiva. Esse tipo de investidor pode realizar operações a favor de um acontecimento em uma partida esportiva (chamada de 'Back').")
                                    .foregroundColor(.gray)
                            }
                            .padding()
                            .frame(width: card.size.width, height: card.size.height,  alignment: .center)
                        }
                            
                    }
                    .padding()
                    .frame(width: bounds.size.width - 40, height: 300)
                    .background(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                    .cornerRadius(12.0)
                    .offset(x: 0, y: 40.0)
                }
                .frame(width: bounds.size.width, height: bounds.size.height, alignment: .center)
                
                
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
                
                
                VStack {
                    SignInWithAppleButton(
                        .signIn,
                        onRequest: { request in
                            // 1
                            request.requestedScopes = [.fullName, .email]
                        },
                        onCompletion: { result in
                            switch result {
                            case .success (let authResults):
                                // 2
                                print("Authorization successful.")
                                switch authResults.credential {
                                case let appleIDCredential as ASAuthorizationAppleIDCredential:
                                    let userID = appleIDCredential.user
                                    if let firstName = appleIDCredential.fullName?.givenName,
                                        let lastName = appleIDCredential.fullName?.familyName,
                                        let email = appleIDCredential.email{
                                        
                                        /// Save to local
                                        UserDefaults.standard.set(userID, forKey: "userID")
                                        UserDefaults.standard.set(email, forKey: "email")
                                        UserDefaults.standard.set(firstName, forKey: "firstName")
                                        UserDefaults.standard.set(lastName, forKey: "lastName")
                                    } else {
                                        
                                        print(UserDefaults.standard.string(forKey: "userID") ?? "")
                                        print(UserDefaults.standard.string(forKey: "email") ?? "")
                                        print(UserDefaults.standard.string(forKey: "firstName") ?? "")
                                        print(UserDefaults.standard.string(forKey: "lastName") ?? "")
                                    }
                                    
                                    
                                // default break (don't remove)
                                default:
                                    break
                                }
                                self.isLogin = true
                            case .failure (let error):
                                // 3
                                print("Authorization failed: " + error.localizedDescription)
                            }
                        }
                    )
                    .frame(width: 300, height: 60)
                }
                .frame(width: bounds.size.width, height: bounds.size.height, alignment: .bottom)
                .offset(x: 0, y: -25.0)
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
