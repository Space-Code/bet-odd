//
//  ApostaNetworking.swift
//  bet odd
//
//  Created by Rodrigo Santos on 25/09/20.
//

import Foundation

class ApostaNetworking {
    
    static let shared = ApostaNetworking()
    
    
    func getApostaWinWin(completion: @escaping ([Aposta]) -> ()) {
        guard let url = URL(string: "https://win-odd.herokuapp.com/win/search") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            
            /// Check for Error
            if let error = error {
                print("Error took place \(error)")
                return
            }
            
            guard let data = data else { return }
            guard let _ = response else { return }
            
            do {
                let apostas = try JSONDecoder().decode([Aposta].self, from: data)
                DispatchQueue.main.async {
                    completion(apostas)
                }
            } catch {
                print("JSON error: \(error.localizedDescription)")
            }

        }
        .resume()
    }
    
    func getApostaDiversos(completion: @escaping ([Aposta]) -> ()) {
        guard let url = URL(string: "https://win-odd.herokuapp.com/diversos/search") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            
            /// Check for Error
            if let error = error {
                print("Error took place \(error)")
                return
            }
            
            guard let data = data else { return }
            guard let _ = response else { return }
            
            do {
                let apostas = try JSONDecoder().decode([Aposta].self, from: data)
                DispatchQueue.main.async {
                    completion(apostas)
                }
            } catch {
                print("JSON error: \(error.localizedDescription)")
            }

        }
        .resume()
    }
    
    func setApostaWinWin(_ aposta: Aposta, completion: @escaping (Aposta) -> ()) {
        let url = URL(string: "https://win-odd.herokuapp.com/win/save")
        
        guard let requestUrl = url else { fatalError() }
        // Prepare URL Request Object
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // HTTP Request Parameters which will be sent in HTTP Request Body
        let encoder = JSONEncoder()
        
        guard let data = try? encoder.encode(aposta) else { return }
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
                
                let banca = try JSONDecoder().decode(Aposta.self, from: data)
                DispatchQueue.main.async {
                    completion(banca)
                }
            } catch {
                print("JSON error: \(error.localizedDescription)")
            }
            
        }.resume()
        
    }
    
    func setApostaDiversos(_ aposta: Aposta, completion: @escaping (Aposta) -> ()) {
        let url = URL(string: "https://win-odd.herokuapp.com/diversos/save")
        
        guard let requestUrl = url else { fatalError() }
        // Prepare URL Request Object
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // HTTP Request Parameters which will be sent in HTTP Request Body
        let encoder = JSONEncoder()
        
        guard let data = try? encoder.encode(aposta) else { return }
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
                
                let banca = try JSONDecoder().decode(Aposta.self, from: data)
                DispatchQueue.main.async {
                    completion(banca)
                }
            } catch {
                print("JSON error: \(error.localizedDescription)")
            }
            
        }.resume()
        
    }
    
}
