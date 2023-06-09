//
//  FinderGameApp.swift
//  FinderGame
//
//  Created by Carolane LEFEBVRE on 30/05/2023.
//

import SwiftUI

@main
struct FinderGameApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(classifier: ImageClassifier())
        }
    }
}
