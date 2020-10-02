//
//  BancaNetwork.swift
//  bet odd
//
//  Created by Rodrigo Santos on 23/09/20.
//

import Foundation


class BancaNetworking {
    
    static let shared = BancaNetworking()
    
    
    func getBancaById(completion: @escaping (Banca) -> ()) {
        guard let url = URL(string: "https://win-odd.herokuapp.com/banca/search/11") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            
            /// Check for Error
            if let error = error {
                print("Error took place \(error)")
                return
            }
            
            guard let data = data else { return }
            guard let _ = response else { return }
            
            do {
                let banca = try JSONDecoder().decode(Banca.self, from: data)
                DispatchQueue.main.async {
                    completion(banca)
                }
            } catch {
                print("JSON error: \(error.localizedDescription)")
            }

        }
        .resume()
    }
    
    func setBanca(_ banca: Banca, completion: @escaping (Banca) -> ()) {
            let url = URL(string: "https://win-odd.herokuapp.com/banca/save")
            
            guard let requestUrl = url else { fatalError() }
            // Prepare URL Request Object
            var request = URLRequest(url: requestUrl)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            // HTTP Request Parameters which will be sent in HTTP Request Body
            let encoder = JSONEncoder()
            
            guard let data = try? encoder.encode(banca) else { return }
            let json = try! JSONSerialization.jsonObject(with: data, options: [])
            print(json)
            
            
            // Set HTTP Request Body
            request.httpBody = data
            
            // Perform HTTP Request
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                // Check for Error
                if let error = error {
                    print("Error took place \(error)")
                    return
                }
                
                guard let data = data else { return }
                guard let _ = response else { return }
                
                print(data)
                
                
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                    
                    let banca = try JSONDecoder().decode(Banca.self, from: data)
                    DispatchQueue.main.async {
                        completion(banca)
                    }
                } catch {
                    print("JSON error: \(error.localizedDescription)")
                }
                
            }.resume()
            
        }
    
}
