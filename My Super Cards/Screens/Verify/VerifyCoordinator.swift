//
//  VerifyCoordinator.swift
//  My Super Cards
//
//  Created by Yavorsky on 05.10.2023.
//

import Foundation
class VerifyCoordinator: ObservableObject {
	@Published var email = ""
	@Published var name = ""
	@Published var router = Router()
	private let fbManager: FBManager
	
	
	init(router: Router, fbManager: FBManager) {
		self.router = router
		self.fbManager = fbManager
		
	}
}
