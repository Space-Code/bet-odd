//
//  Home.swift
//  bet odd
//
//  Created by Rodrigo Santos on 20/09/20.
//

import SwiftUI

struct Home: View {
    
    @Binding var banca: Banca
    @Binding var router: Router
    
    func valueBet(value: Double) -> String {
        return String(format: "%.2f", value)
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
                    Button(action: { router = .config }) {
                        Image(systemName: "gear")
                            .font(.system(size: 40))
                    }
                    .padding(.horizontal, 20)
                }
                .frame(width: bounds.size.width, height: 50, alignment: .topTrailing)
                .offset(x: 0, y: 30.0)
                
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
                                Text("\(valueBet(value: banca.valorBanca))")
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
                    Color(.white)
                }
                .background(Color(#colorLiteral(red: 0.8980392157, green: 0.9254901961, blue: 0.9254901961, alpha: 1)))
                .cornerRadius(12)
                .frame(width: bounds.size.width, height: bounds.size.height + bounds.safeAreaInsets.bottom - 250, alignment: .center)
                .offset(x: 0, y: 250.0)
                
                
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home(banca: .constant(Banca(valorBanca: 70000)), router: .constant(.home))
            .preferredColorScheme(.dark)
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
