//
//  GameClass.swift
//  FinderGame
//
//  Created by Carolane LEFEBVRE on 09/06/2023.
//

import Foundation

class GameClass: ObservableObject {
    // Rounds options Variables
    @Published var rounds = 0
    @Published var roundsOption = [5, 10, 15]
    @Published var selectedRound = 5
}
