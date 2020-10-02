//
//  WinWin.swift
//  bet odd
//
//  Created by Rodrigo Santos on 21/09/20.
//

import SwiftUI

struct WinWin: View {
    
    @ObservedObject var data = WinState()
    
    @Binding var router: Router
    
    @State var firstBet: Bool = true
    @State var showResult: Bool = false
    
    func handleFirstButton() {
        self.firstBet = false
    }
    func handlePressBack() {
        self.firstBet = true
    }
    func handleSubmit() {
        self.showResult.toggle()
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
                    Text("Win ou Win")
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
                    
                    ScrollView(.vertical) {
                        ScrollViewReader { scrollView in
                            LazyVStack {
                                if firstBet {
                                    BetView(Title: "Corretora 01", odd: $data.firstOdd, OddPay: $data.firstOddPay, OddWinner: $data.firstOddWinner, OddPercent: $data.firstOddPercent)
                                } else {
                                    BetView(Title: "Corretora 02", odd: $data.secondOdd, OddPay: $data.secondOddPay, OddWinner: $data.secondOddWinner, OddPercent: $data.secondOddPercent)
                                }
                            }.offset(y: 50)
                        }
                    }
                    
                    ZStack {
                        Image("welcome")
                            .resizable()
                            .frame(height: 400)
                            .offset(y: 100)
                        
                        VStack {
                            if firstBet {
                                Button(action: handleFirstButton) {
                                    Text("Continuar")
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                                        .frame(width: 200, height: 60)
                                        .cornerRadius(12)
                                        .shadow(radius: 10)
                                }
                                .offset(y: 80)
                            } else {
                                HStack {
                                    Button(action: handlePressBack) {
                                        HStack(alignment: .center) {
                                            Text("Voltar")
                                                .font(.title2)
                                                .fontWeight(.bold)
                                                .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                                        }
                                        .frame(width: 100, height: 60)
                                        .cornerRadius(12)
                                        .shadow(radius: 10)
                                    }
                                    
                                    Spacer()
                                    
                                    Button(action: handleSubmit) {
                                        HStack(alignment: .center) {
                                            Text("Confirmar")
                                                .font(.title2)
                                                .fontWeight(.bold)
                                                .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                                            Image(systemName: "dollarsign.circle.fill")
                                                .font(.title)
                                                .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                                        }
                                        .frame(width: 200, height: 60)
                                        .cornerRadius(12)
                                        .shadow(radius: 10)
                                    }
                                    .sheet(isPresented: self.$showResult) {
                                        ResumoWinWin(data: data, router: $router)
                                    }
                                }
                                .offset(y: 80)
                            }
                        }
                    }
                    .offset(y: 200)
                    
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

struct WinWin_Previews: PreviewProvider {
    static var previews: some View {
        WinWin(router: .constant(.winwin))
    }
}

struct BetView: View {
    
    
    var Title: String
    
    @Binding var odd: String
    @Binding var OddPay: String?
    @Binding var OddWinner: String?
    @Binding var OddPercent: String?
    
    var body: some View {
        LazyVStack {
            VStack {
                HStack {
                    Text(Title)
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
                    
                    TextField("0,00", text: $odd)
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
                    
                    Text("R$ \(OddPay ?? "0.00")")
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

                    Text("R$ \(OddWinner ?? "0.00")")
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
                    
                    Text("\(OddPercent ?? "0.00") %")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.trailing, 10)
                }
                .padding()
                
            }
            .padding(.horizontal)
            .offset(y: -30)
        }
    }
}
