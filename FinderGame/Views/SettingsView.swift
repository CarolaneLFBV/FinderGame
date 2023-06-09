//
//  SettingsVie<w.swift
//  FinderGame
//
//  Created by Carolane LEFEBVRE on 09/06/2023.
//

import SwiftUI

struct SettingsView: View {
    @StateObject var rounds = GameClass()
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Game options") {
                    Picker("Pick a number of rounds", selection: $rounds.selectedRound) {
                        ForEach(rounds.roundsOption, id: \.self) {
                            Text($0, format: .number)
                        }
                        .font(.caption)
                    }
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
