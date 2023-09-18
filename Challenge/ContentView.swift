//
//  ContentView.swift
//  Challenge
//
//  Created by Avyan Mehra on 14/8/23.
//

import SwiftUI
struct spell: Identifiable {
    var spellName: String
    var level: Int
    var whoMadeIt: String
    var whatItDoes: String
    var id = UUID()
    var isGood: Bool
}


struct ContentView: View {
    @Binding var selectedSpell: spell
    @State var Sheet = false
    @State var num: Int = 0
    @State var removeIndex = 0
    let placeHolder = spell(spellName: "", level: 0, whoMadeIt: "", whatItDoes: "", id: UUID(), isGood: false)
    @State  var spellBook: [spell] = [
        spell(spellName: "Expelliarmus", level: 3, whoMadeIt: "Snape", whatItDoes: "Throws wand away", isGood: false),
        spell(spellName: "Sectumsemphra", level: 24, whoMadeIt: "Snape", whatItDoes: "Bursts Arteries", isGood: false),
        
    ]
    
    func remove(at offsets: IndexSet) {
        spellBook.remove(atOffsets: offsets)
    }
    
    var body: some View {
        
        NavigationStack {
            VStack {
                Menu {
                    
                    Button {
                        
                        for _ in $spellBook {
                            spellBook[num].isGood = true
                            num += 1
                        }
                        num = 0
                        
                    } label: {
                        Text("Everything becomes good")
                    }
                    Button {
                        for _ in $spellBook {
                            spellBook[num].isGood = false
                            num += 1
                        }
                        num = 0
                    } label: {
                        Text("Everything becomes bad")
                    }
                    Button {
                        spellBook = []
                    } label: {
                        Text("Everything becomes non-existent")
                    }
                    
                } label: {
                    Text("Mass Extinction Options")
                }
                List {
                                        ForEach($spellBook, id: \.id) { book in
                                            NavigationLink{
                                                spellView(name: book.spellName, level: book.level, who: book.whoMadeIt, what: book.whatItDoes, good: book.isGood)
                                            }  label: {
                                                VStack(alignment: .leading) {
                                                    Text("🪄 Name: \(book.spellName.wrappedValue)")
                                                        .font(.title2)
                                                    Spacer()
                                                    Text("🔺 Level: \(book.level.wrappedValue)")
                                                    Text("🕴️Who: \(book.whoMadeIt.wrappedValue)")
                                                    Text("❓What: \(book.whatItDoes.wrappedValue)")
                                                    Text("😇 Goodness: \(book.isGood.wrappedValue.description)")
                                                }
                    
                                            }
                                            .contextMenu{
                                                Button {
                                                    for spell in $spellBook {
                    
                                                        if spell.spellName.wrappedValue == book.spellName.wrappedValue && spell.whatItDoes.wrappedValue == book.whatItDoes.wrappedValue {
                                                            spellBook.remove(at: removeIndex)
                                                            removeIndex = 0
                                                        } else {
                                                            removeIndex += 1
                                                        }
                                                    }
                    
                                                } label: {
                                                        Text("Uningardium Existus!!!")
                                                    }
                                                }
                    
                                            }
                                            .onDelete(perform: remove)
                                            .onMove { from, to in spellBook.move(fromOffsets: from, toOffset: to)
                                            }
            
                    
                    
                }
                    
                    
                    
                    .navigationTitle("Spellbook")
                    .navigationBarTitleDisplayMode(.large)
                    .toolbar{
                        Button{
                            Sheet = true
                            spellBook.append(spell(spellName: "", level: 0, whoMadeIt: "", whatItDoes: "", id: UUID(), isGood: false))
                            
                        } label: {
                            Text("+")
                                .fontWeight(.medium)
                                .font(.largeTitle)
                        }
                    }
                    .toolbar {
                        EditButton()
                    }
                    .sheet(isPresented: $Sheet) {
                        addView(
                            currentLevel: $spellBook[spellBook.count-1].level ,
                            
                            currentName: $spellBook[spellBook.count-1 ].spellName,
                            
                            currentPerson: $spellBook[spellBook.count-1 ].whoMadeIt,
                            
                            currentDescription: $spellBook[spellBook.count-1 ].whatItDoes,
                            
                            currentGood: $spellBook[spellBook.count-1].isGood,
                            
                            sheetShown: $Sheet,
                            
                            currentSpell: spell(spellName: "", level: 0, whoMadeIt: "", whatItDoes: "", id: UUID(), isGood: false)  )
                    }
                }
            }
        }
        
        struct ContentView_Previews: PreviewProvider {
            static var previews: some View {
                ContentView(selectedSpell: .constant(spell(spellName: "", level: 0, whoMadeIt: "", whatItDoes: "", isGood: false)))
                
            }
        }
    }
    
