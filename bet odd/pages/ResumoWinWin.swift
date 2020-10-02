//
//  ResumoWinWin.swift
//  bet odd
//
//  Created by Rodrigo Santos on 28/09/20.
//

import SwiftUI

struct ResumoWinWin: View {
    
    @ObservedObject var data = WinState()
    @ObservedObject var aposta = ApostaStore()
    
    @Binding var router: Router
    
    func percentualFinal() -> String {
        
        let first = Double((data.firstOddPay?.replacingOccurrences(of: ",", with: "."))!) ?? 0
        let second = Double((data.secondOddPay?.replacingOccurrences(of: ",", with: "."))!) ?? 0
        
        var percent = 0.0
        if (second > first) {
            percent = (second - first) / 100
        } else {
            percent = (first - second) / 100
        }
        
        return String(format: "%.1f", percent)
        
    }
    
    func retornoFinal() -> String {
        
        let earning = Double((data.earning.replacingOccurrences(of: ",", with: "."))) ?? 0
        let first = Double((data.firstOddPay?.replacingOccurrences(of: ",", with: "."))!) ?? 0
        let second = Double((data.secondOddPay?.replacingOccurrences(of: ",", with: "."))!) ?? 0
        
        let retorno = (earning - (first + second))
        
        return String(format: "%.2f", retorno)
        
    }
    
    func submitWinWin() {
        
        let first = Double((data.firstOddPay?.replacingOccurrences(of: ",", with: "."))!) ?? 0
        let second = Double((data.secondOddPay?.replacingOccurrences(of: ",", with: "."))!) ?? 0
        
        let valorTotal = (first + second)
        
        let betodd: Aposta = Aposta(tag: Tag.winwin.rawValue, totalInvestido: Int(valorTotal))
        
        aposta.setApostaWinWin(aposta: betodd ){ bet in
            router = .home
        }
    }
    
    var body: some View {
        GeometryReader { bounds in
            
            ZStack {
                
                ZStack {
                    Image("pattern")
                        .frame(width: bounds.size.width, alignment: .topTrailing)
                        .edgesIgnoringSafeArea(.top)
                }
                .frame(width: bounds.size.width, height: bounds.size.height, alignment: .top)
                
                VStack {
                    Text("Resumo")
                        .font(.title3)
                    Text("Win Win")
                        .font(.title2)
                        .fontWeight(.bold)
                }
                .frame(width: bounds.size.width, height: bounds.size.height, alignment: .top)
                .offset(y: 30)
                
                VStack {
                    VStack {
                        HStack {
                            Image(systemName: "01.square.fill")
                                .font(.title)
                            Text("Corretora")
                                .font(.title3)
                                .fontWeight(.bold)
                            
                            Spacer()
                            
                            Text("ODD: \(data.firstOdd)")
                                .fontWeight(.bold)
                        }
                        .padding(.top)
                        .padding(.horizontal)
                        .frame(width: bounds.size.width - 20, alignment: .leading)
                        
                        
                        Divider()
                            .padding(.horizontal)
                        
                        Spacer()
                        
                        HStack {
                                                        
                            VStack {
                                Text("Apostar")
                                Text("R$ \(data.firstOddPay ?? "0.00")")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .padding(.trailing, 10)
                            }
                            
                            Spacer()
                            
                            VStack {
                                Text("Retorno")
                                Text("R$ \(data.firstOddWinner ?? "0.00")")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .padding(.trailing, 10)
                            }
                        }
                        .padding()
                        .padding(.horizontal)
                        .frame(width: bounds.size.width - 20, alignment: .center)
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                    .frame(width: bounds.size.width - 20, height: 150, alignment: .center)
                    .background(Color("Color4"))
                    .cornerRadius(12.0)

                    Spacer()
                    
                    VStack {
                        HStack {
                            Image(systemName: "02.square.fill")
                                .font(.title)
                            Text("Corretora")
                                .font(.title3)
                                .fontWeight(.bold)
                            
                            Spacer()
                            
                            Text("ODD: \(data.secondOdd)")
                                .fontWeight(.bold)
                        }
                        .padding(.top)
                        .padding(.horizontal)
                        .frame(width: bounds.size.width - 20, alignment: .leading)
                        
                        Divider()
                            .padding(.horizontal)
                        
                        Spacer()
                        
                        HStack {
                            
                            VStack {
                                Text("Apostar")
                                Text("R$ \(data.secondOddPay ?? "0.00")")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .padding(.trailing, 10)
                            }
                            
                            Spacer()
                            
                            Spacer()
                            
                            VStack {
                                Text("Retorno")
                                Text("R$ \(data.secondOddWinner ?? "0.00")")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .padding(.trailing, 10)
                            }
                        }
                        .padding()
                        .padding(.horizontal)
                        .frame(width: bounds.size.width - 20, alignment: .center)
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                    .frame(width: bounds.size.width - 20, height: 150, alignment: .center)
                    .background(Color("Color4"))
                    .cornerRadius(12.0)
                    
                    Spacer()
                    
                    VStack {
                        HStack {
                            Text("Percentual")
                                .font(.title3)
                                .fontWeight(.bold)
                            
                            Spacer()
                            
                            Text("\(percentualFinal()) %")
                                .fontWeight(.bold)
                        }
                        .padding(.horizontal)
                        .frame(width: bounds.size.width - 20, alignment: .leading)
                                                
                    }
                    .padding()
                    .frame(width: bounds.size.width - 20, alignment: .center)
                    .background(Color("Color4"))
                    .cornerRadius(12.0)
                    
                    Spacer()
                    
                    VStack {
                        HStack {
                            Text("Retorno final")
                                .font(.title3)
                                .fontWeight(.bold)
                            
                            Spacer()
                            
                            Text("R$ \(retornoFinal()) ")
                                .fontWeight(.bold)
                        }
                        .padding(.horizontal)
                        .frame(width: bounds.size.width - 20, alignment: .leading)
                                 
                    }
                    .padding()
                    .frame(width: bounds.size.width - 20, alignment: .center)
                    .background(Color("Color4"))
                    .cornerRadius(12.0)
                    
                    Spacer()
                    
                    Button(action: submitWinWin) {
                        VStack {
                            Text("Confirmar")
                                .font(.title2)
                                .foregroundColor(.white)
                        }
                        .frame(width: bounds.size.width - 20, height: 60, alignment: .center)
                        .background(
                            LinearGradient(gradient: .init(colors: [Color(#colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)),Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        )
                        .cornerRadius(12)
                    }
                    .padding(.top, 50)
                    .padding(.bottom, 20)
                }
                .frame(width: bounds.size.width, height: bounds.size.height - 400)

            }
        }
    }
}

struct ResumoWinWin_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ResumoWinWin(router: .constant(.winwin))
            ResumoWinWin(router: .constant(.winwin))
                .preferredColorScheme(.dark)
        }
    }
}





















