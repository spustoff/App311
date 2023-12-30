//
//  App311App.swift
//  App311
//
//  Created by IGOR on 28/12/2023.
//

import SwiftUI
import FirebaseCore
import ApphudSDK
import OneSignalFramework
import Amplitude

class AppDelegate: NSObject, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        Apphud.start(apiKey: "app_nsvE5r2TkB3E6c54Z4XWYbRwNv3SQX")
        
        OneSignal.initialize("db23080f-bc7c-44a5-b2c7-3f20eb95bd2c", withLaunchOptions: launchOptions)
        Amplitude.instance().initializeApiKey("d7c14acc111e83e4de6fcae719ec68a3")
        
        Amplitude.instance().defaultTracking.sessions = true
        Amplitude.instance().setUserId(Apphud.userID())
        OneSignal.login(Apphud.userID())
        
        FirebaseApp.configure()
        
        return true
    }
}

func decodeBase64(_ base64String: String) -> String {
    
    guard let data = Data(base64Encoded: base64String) else { return base64String }
    
    guard let decodedResult = String(data: data, encoding: .utf8) else { return base64String }
    
    return decodedResult
}

@main
struct App311App: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        
        WindowGroup {
            
            NavigationView(content: {

                ContentView()
            })
        }
    }
}
