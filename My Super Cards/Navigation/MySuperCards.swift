//
//  My_Super_CardsApp.swift
//  My Super Cards
//
//  Created by Yavorsky on 29.09.2023.
//

import SwiftUI
import Firebase
import Foundation

class AppDelegate: NSObject, UIApplicationDelegate {
	
	func application(_ application: UIApplication,
					 didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
		FirebaseApp.configure()
		
		return true
	}
}
@main

struct SwiftUIRouterApp: App {
	
	@UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
	@ObservedObject var router = Router()
	 let fbManager = FBManager()
	
	var body: some Scene {
		WindowGroup {
			ZStack {
				if router.currentRoute == .registration {
					RegistrationView(coordinator: RegistrationCoordinator(router: router, fbManager: fbManager))
					
						.transition(.move(edge: .leading))
						.animation(.easeInOut(duration: 0.4))
					
					
				} else if router.currentRoute == .login {
					LoginView(coordinator: LoginCoordinator(router: router, fbManager: fbManager))
					
						.transition(.move(edge: .trailing))
						.animation(.easeInOut(duration: 0.4))
					
				} else if router.currentRoute == .verify {
					VerifyView(coordinator: VerifyCoordinator(router: router, fbManager: fbManager))
					
						.transition(.move(edge: .trailing))
						.animation(.easeInOut(duration: 0.4))
					
				} else if router.currentRoute == .main {
					MainView(coordinator: MainCoordinator(routers: router, fbManager: fbManager))
						.environmentObject(router)
					
						.transition(.move(edge: .trailing))
						.animation(.easeInOut(duration: 0.4))
					
					
				} else if router.currentRoute == .settings {
					SettingsView(coordinator: SettingsCoordinator(routers: router, fbManager: fbManager ))
						.environmentObject(router)
						.transition(.move(edge: .trailing))
						.animation(.easeInOut(duration: 0.4))
						
					
				} else if router.currentRoute == .myCards {
					MyCardsView(coordinator: MyCardsCoordinator(fbManager: fbManager, router: router))
					
						.transition(.move(edge: .trailing))
						.animation(.easeInOut(duration: 0.4))
					
					
				}
				
			}
					.onAppear(){
						
						router.currentRoute = .login
						
						
					}
				
			
		}
		
	}
}

