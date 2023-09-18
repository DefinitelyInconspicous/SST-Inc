//
//  addView.swift
//  Challenge
//
//  Created by Avyan Mehra on 14/8/23.
//

import SwiftUI




struct addView: View {
    @Binding public var currentLevel: Int
    @Binding public var currentName: String
    @Binding public var currentPerson: String
    @Binding public var currentDescription: String
    @Binding public var currentGood: Bool
    
    
    @Binding var sheetShown: Bool
    @State private var placeHolder = spell(spellName: "", level: 0, whoMadeIt: "", whatItDoes: "", id: UUID(), isGood: false)
    @State var currentSpell: spell
    
    
    var body: some View {
        NavigationStack {
            Form {
                
                TextField("Name of Spell", text: $currentName)
                Stepper(value: $currentLevel, in: 1...1000) {
                    Text("Level: \(currentLevel)")
                }
                TextField("Who Made It?", text: $currentPerson)
                TextField("What does it do?", text: $currentDescription)
                Toggle("Is it good?:", isOn: $currentGood)
                    .foregroundColor(.red)
                Spacer()
                
                Button {
                    currentSpell = spell(spellName: currentName, level: currentLevel, whoMadeIt: currentPerson, whatItDoes: currentDescription, id: UUID(), isGood: false)
                    sheetShown = false
                    
                } label: {
                    
                    Text("Done")
                }
               
                
                
            }
            
            .navigationTitle("Spell Creation Page")
            Spacer()
            
           

        }
            }
    
    
    
    struct addView_Previews: PreviewProvider {
        static var previews: some View {
            addView(currentLevel: .constant(0), currentName: .constant(""), currentPerson: .constant(""), currentDescription: .constant(""), currentGood: .constant(false), sheetShown:  .constant(false), currentSpell:spell(spellName: "", level: 0, whoMadeIt: "", whatItDoes: "", isGood: false) )
            
        }
    }
}
