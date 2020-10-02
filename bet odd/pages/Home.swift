//
//  Home.swift
//  bet odd
//
//  Created by Rodrigo Santos on 20/09/20.
//

import SwiftUI

struct Home: View {
    
    @ObservedObject var store = BancaStore()
    @ObservedObject var aposta = ApostaStore()
    
    @Binding var router: Router
    
    @State var banca: Banca?
    
    @State var apostas: [Aposta] = []
    
    func valueBet(value: Double) -> String {
        return String(format: "%.2f", value)
    }
        
    func onInit() {
        store.getBancaById() { banca in
            self.banca = banca
        }
        
        aposta.getApostaWinWin() { aposta in
            apostas.append(contentsOf: aposta)
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
                
//                VStack {
//                    Button(action: { router = .config }) {
//                        Image(systemName: "gear")
//                            .font(.system(size: 40))
//                    }
//                    .padding(.horizontal, 20)
//                }
//                .frame(width: bounds.size.width, height: 50, alignment: .topTrailing)
//                .offset(x: 0, y: 30.0)
                
                VStack {
                    VStack(alignment: .leading) {
                        Text("Banca")
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
                                Text("\(valueBet(value: banca?.valorBanca ?? 0))")
                                    .foregroundColor(.white)
                                    .font(.title2)
                                    .fontWeight(.bold)
                                Spacer()
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                }
                .frame(width: bounds.size.width, height: 50, alignment: .topLeading)
                .offset(x: 0, y: 70.0)
                
                VStack {
                    HStack(alignment: .center) {
                        Spacer()
                        Button(action: { router = .winwin }) {
                            VStack {
                                Image(systemName: "chart.bar.fill")
                                    .font(.system(size: 30))
                                    .foregroundColor(.white)
                                Spacer()
                                Text("Win ou Win")
                                    .font(.caption)
                                    .foregroundColor(.white)
                            }
                        }
                        Spacer()
                        ExDivider(height: 30)
                        Spacer()
                        Button(action: { router = .diversos }) {
                            VStack {
                                Image(systemName: "dollarsign.square.fill")
                                    .font(.system(size: 35))
                                    .foregroundColor(.white)
                                Spacer()
                                Text("Diversos")
                                    .font(.caption)
                                    .foregroundColor(.white)
                            }
                        }
                        Spacer()
                    }
                }
                .frame(width: bounds.size.width, height: 50, alignment: .center)
                .offset(x: 0, y: 160.0)
                
                VStack {
                    
                    HStack {
                        Text("Tipo de aposta")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                        Text("Invertimento")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                    }.padding()
                    
                    ScrollView {
                        VStack {
                            ForEach(apostas) { item in
                                Bet(aposta: item, bounds: bounds)
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                }
                .frame(width: bounds.size.width, height: bounds.size.height + bounds.safeAreaInsets.bottom - 250, alignment: .top)
                .background(Color(#colorLiteral(red: 0.8980392157, green: 0.9254901961, blue: 0.9254901961, alpha: 1)))
                .cornerRadius(12)
                .offset(x: 0, y: 250.0)
                .edgesIgnoringSafeArea(.bottom)
                
            }
        }
        .onAppear(perform: onInit)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home(router: .constant(.home))
    }
}

struct ExDivider: View {
    var color: Color = .gray
    var width: CGFloat = 2
    var height: CGFloat = 2
    var body: some View {
        Rectangle()
            .fill(color)
            .frame(width: width, height: height)
            .edgesIgnoringSafeArea(.horizontal)
    }
}

struct Bet: View {
    
    var aposta: Aposta
    
    var bounds: GeometryProxy
    
    var body: some View {
        VStack {
            HStack {
                Text(aposta.tag)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                Spacer()
                
                Text("R$ \(aposta.totalInvestido)")
                    .fontWeight(.bold)
                    .foregroundColor(.black)
            }
            .padding(.horizontal)
            .frame(width: bounds.size.width - 20, alignment: .leading)
            
        }
        .padding()
        .frame(width: bounds.size.width - 20, alignment: .center)
        .background(Color(.white))
        .cornerRadius(12.0)
    }
}
