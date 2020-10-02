//
//  bet_oddApp.swift
//  bet odd
//
//  Created by Rodrigo Santos on 20/09/20.
//

import SwiftUI
import Firebase

@main
struct bet_oddApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ViewRouter())
        }
    }
}

class AppDelegate: NSObject,UIApplicationDelegate ,ObservableObject{
    
    @Published var email = ""
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions:
                        [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Intial Firebase
        FirebaseApp.configure()
                
        return true
    }
    
}
