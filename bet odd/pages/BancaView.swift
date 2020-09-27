//
//  Banca.swift
//  bet odd
//
//  Created by Rodrigo Santos on 23/09/20.
//

import SwiftUI

struct BancaView: View {
    
    /// Observables
    @EnvironmentObject var store: BancaStore
    @State var valorBanca: String = ""
    
    @Binding var isBanca: Bool
    @Binding var banca: Banca
    
    
    func gravarBanca() {
        // MARK: - Create Banca
        
        let banca: Banca = Banca(valorBanca: Double(valorBanca) ?? 0)
        
        self.store.setBanca(banca: banca) { (banca) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.isBanca = false
                
                self.banca = banca
            }
        }
        
    }
    
    
    var body: some View {
        GeometryReader { bounds in
            VStack(alignment: .center) {
                
                Spacer()
                
                Text("Qual o valor da sua banca?")
                    .font(.title2)
                    .fontWeight(.bold)
                
                HStack {
                    
                    Text("R$")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    TextField("0,00", text: $valorBanca)
                        .keyboardType(.decimalPad)
                        .font(.title)
                        .frame(width: 200)
                    
                }
                
                Spacer()
                
                
                Button(action: gravarBanca) {
                    VStack {
                        Text("Confirmar")
                            .font(.title2)
                            .foregroundColor(.white)
                    }
                    .frame(width: 300, height: 60, alignment: .center)
                    .background(
                    
                        LinearGradient(gradient: .init(colors: [Color(#colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)),Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    )
                    .cornerRadius(12)
                }
                .padding(.bottom, 20)
                

            }
            .frame(width: bounds.size.width, height: bounds.size.height, alignment: .center)

        }
    }
}

struct BancaView_Previews: PreviewProvider {
    static var previews: some View {
        BancaView(isBanca: .constant(true), banca: .constant(Banca(id: 0, valorBanca: 3000)))
    }
}
