//
//  My_Super_CardsApp.swift
//  My Super Cards
//
//  Created by Yavorsky on 29.09.2023.
//

import SwiftUI

import Firebase


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
				   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
	FirebaseApp.configure()

	return true
  }
}

@main
struct My_Super_Cards: App {
	//Register Firebase
	@UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
