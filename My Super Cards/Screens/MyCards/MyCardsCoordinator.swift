//
//  MyCardsViewCoordinator.swift
//  My Super Cards
//
//  Created by Yavorsky on 10.10.2023.
//

import Foundation
import Firebase

class MyCardsCoordinator: ObservableObject{

	private let fbManager: FBManager
	@Published var router: Router
	init( fbManager: FBManager, router: Router) {
		self.router = router
		self.fbManager = fbManager
		
	}
}
