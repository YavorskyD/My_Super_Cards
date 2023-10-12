//
//  MyCardsView.swift
//  My Super Cards
//
//  Created by Yavorsky on 10.10.2023.
//

import SwiftUI

struct MyCardsView: View {
	@ObservedObject var coordinator: MyCardsCoordinator
	@EnvironmentObject var router: Router
	
	private let fbmanager  = FBManager()
	
    var body: some View {
		ScrollView {
			Text("MyCards")
		}
	}
}

struct MyCardsView_Previews: PreviewProvider {
    static var previews: some View {
		MyCardsView(coordinator: MyCardsCoordinator(fbManager:FBManager(), router: Router()))
	}
}
