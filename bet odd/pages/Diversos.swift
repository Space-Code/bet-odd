//
//  Diversos.swift
//  bet odd
//
//  Created by Rodrigo Santos on 24/09/20.
//

import SwiftUI

struct Diversos: View {
    
    @ObservedObject var data = WinState()
    @ObservedObject var aposta = ApostaStore()
    
    @Binding var router: Router
    
    
    func submitDiversos() {
        
        let first = Double((data.firstOddPay?.replacingOccurrences(of: ",", with: "."))!) ?? 0
                
        let betodd: Aposta = Aposta(tag: Tag.diversos.rawValue, totalInvestido: Int(first))
        
        aposta.setApostaWinWin(aposta: betodd) { bet in
            router = .home
        }
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
                    Text("Diversos")
                        .font(.system(size: 22))
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                }
                .frame(width: bounds.size.width, height: 50, alignment: .top)
                .offset(x: 0, y: 20.0)
                
                VStack {
                    VStack(alignment: .leading) {
                        Text("Quanto quer ganhar?")
                            .foregroundColor(.white)
                            .font(.subheadline)
                        
                        HStack(alignment: .center) {
                            VStack {
                                Text("R$")
                                    .foregroundColor(.white)
                                    .font(.subheadline)
                                Spacer()
                            }
                            VStack {
                                TextField("0,00", text: $data.earning)
                                    .keyboardType(.decimalPad)
                                    .foregroundColor(.white)
                                    .font(.title)
                                    .offset(y: -4)
                                Spacer()
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                }
                .frame(width: bounds.size.width, height: 50, alignment: .topLeading)
                .offset(x: 0, y: 70.0)
                
                ZStack {
                    VStack {
                        HStack {
                            Text("Corretora 01")
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
                        
                        Divider()
                        
                        HStack {
                            Text("Valor da ODD:")
                                .foregroundColor(.black)

                            Spacer()
                            
                            TextField("0,00", text: $data.firstOdd)
                                .keyboardType(.decimalPad)
                                .font(.system(size: 20, weight: .heavy, design: .default))
                                .multilineTextAlignment(.trailing)
                                .foregroundColor(.black)
                                .padding()
                                .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                                .cornerRadius(12)
                                .shadow(radius: 8)
                                .padding(.leading, 10)
                            
                        }
                        .padding(.horizontal)
                        
                        HStack {
                            Text("Quanto deve apostar:")
                                .foregroundColor(.black)

                            Spacer()

                            Text("R$ \(data.firstOddPay ?? "0.00")")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .padding(.trailing, 10)
                        }
                        .padding()

                        HStack {
                            Text("Retorno da ODD:")
                                .foregroundColor(.black)

                            Spacer()

                            Text("R$ \(data.firstOddWinner ?? "0.00")")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .padding(.trailing, 10)
                        }
                        .padding()
                        
                        HStack {
                            Text("Porcentagem de retorno:")
                                .foregroundColor(.black)

                            Spacer()

                            Text("\(data.firstOddPercent ?? "0.00") %")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .padding(.trailing, 10)
                        }
                        .padding()
                        
                    }
                    .padding(.horizontal)
                    .offset(y: -30)
                    
                    ZStack {
                        Image("welcome")
                            .resizable()
                            .frame(height: 400)
                            .offset(y: 100)
                        
                        VStack {
                            Button(action: submitDiversos) {
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
                    .offset(y: 300)
                }
                .frame(width: bounds.size.width, height: bounds.size.height + bounds.safeAreaInsets.bottom - 160, alignment: .top)
                .background(Color(#colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)))
                .cornerRadius(12)
                .offset(x: 0, y: 160.0)
                .edgesIgnoringSafeArea(.bottom)
                
                
            }
        }
        .gesture(DragGesture().onChanged { _ in
            UIApplication.shared.windows.forEach { $0.endEditing(false) }
        })
    }
}

struct Diversos_Previews: PreviewProvider {
    static var previews: some View {
        Diversos(router: .constant(.diversos))
    }
}
