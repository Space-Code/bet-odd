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
    
    @State var firstName: String?
    @State var lastName: String?
    
    @State var banca: String?
    @State var bancaAcrecimo: String = ""
    
    func incrementBet() {
        
        let aumento = Double((bancaAcrecimo.replacingOccurrences(of: ",", with: "."))) ?? 0
        let atual = Double(((banca?.replacingOccurrences(of: ",", with: "."))!)) ?? 0
        
        let calc = atual + aumento
        
        self.banca = String(calc)
        self.bancaAcrecimo = ""
        
        UserDefaults.standard.set(calc, forKey: "bettingValue")
        
    }
    
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
                        Text("\(lastName ?? "Ultimo nome"),")
                            .foregroundColor(.white)
                            .font(.subheadline)
                        
                        Text("\(firstName ?? "Primeiro nome")")
                            .foregroundColor(.white)
                            .font(.title2)
                    }
                    .padding(.horizontal, 20)
                }
                .frame(width: bounds.size.width, height: 50, alignment: .topLeading)
                .offset(x: 0, y: 70.0)
                
                ZStack {
                    ScrollView {
                        HStack {
                            Text("Incrementar a banca?")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .padding()
                            Spacer()
                            Image(systemName: "doc.text.viewfinder")
                                .font(.system(size: 30))
                                .foregroundColor(.black)
                                .padding()
                        }
                        .padding(.top)
                        .padding(.horizontal)
                        
                        Divider()
                            .padding(.horizontal)
                        
                        
                        HStack {
                            Text("Atual:")
                                .foregroundColor(.black)

                            Spacer()
                            
                            Text("\(banca ?? "0,00")")
                                .frame(width: 180, alignment: .trailing)
                                .font(.system(size: 20, weight: .heavy, design: .default))
                                .multilineTextAlignment(.trailing)
                                .foregroundColor(.black)
                                .padding()
                                .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                                .cornerRadius(12)
                                .shadow(radius: 8)
                            
                            
                        }
                        .padding()
                        .padding(.top)
                        .padding(.horizontal)
                        
                        
                        HStack {
                            Text("Valor a aumentar:")
                                .foregroundColor(.black)

                            Spacer()
                            
                            TextField("0,00", text: $bancaAcrecimo)
                                .frame(width: 180, alignment: .trailing)
                                .keyboardType(.decimalPad)
                                .font(.system(size: 20, weight: .heavy, design: .default))
                                .multilineTextAlignment(.trailing)
                                .foregroundColor(.black)
                                .padding()
                                .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                                .cornerRadius(12)
                                .shadow(radius: 8)
                            
                        }
                        .padding()
                        .padding(.horizontal)
                        
                    }
                    
                    ZStack {
                        Image("welcome")
                            .resizable()
                            .frame(height: 400)
                            .offset(y: 100)
                        
                        VStack {
                            Button(action: incrementBet) {
                                Text("Confirmar")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                                    .frame(width: 200, height: 60)
                                    .cornerRadius(12)
                                    .shadow(radius: 10)
                            }
                            .offset(y: 100)
                        }
                    }
                    .offset(y: 150)
                }
                .frame(width: bounds.size.width, height: bounds.size.height + bounds.safeAreaInsets.bottom - 160, alignment: .top)
                .background(Color(#colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)))
                .cornerRadius(12)
                .offset(x: 0, y: 160.0)
                .edgesIgnoringSafeArea(.bottom)
                
            }
        }.onAppear(perform: {
            self.firstName = UserDefaults.standard.string(forKey: "firstName")
            self.lastName = UserDefaults.standard.string(forKey: "lastName")
            let value = UserDefaults.standard.double(forKey: "bettingValue")
            
            
            print(value)
            self.banca = String(value)
        })
        .gesture(DragGesture().onChanged { _ in
            UIApplication.shared.windows.forEach { $0.endEditing(false) }
        })
    }
}

struct Config_Previews: PreviewProvider {
    static var previews: some View {
        Config(router: .constant(.config))
    }
}
