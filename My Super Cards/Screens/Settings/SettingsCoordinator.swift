//
//  SettingsCoordinator.swift
//  My Super Cards
//
//  Created by Yavorsky on 10.10.2023.
//

import Foundation
import Firebase
class SettingsCoordinator: ObservableObject{
	@Published var router: Router
	private let fbManager: FBManager
	
	init( routers: Router,  fbManager: FBManager) {
		self.router = routers
		self.fbManager = fbManager
		
	}
}

func addTable(){
	
}
