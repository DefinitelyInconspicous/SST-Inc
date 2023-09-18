//
//  ChallengeApp.swift
//  Challenge
//
//  Created by Avyan Mehra on 14/8/23.
//

import SwiftUI

@main
struct ChallengeApp: App {
    @State private var placeHolder = spell(spellName: "", level: 0, whoMadeIt: "", whatItDoes: "", isGood: false)
    var body: some Scene {
        WindowGroup {
            ContentView(selectedSpell: $placeHolder)
        }
    }
}
