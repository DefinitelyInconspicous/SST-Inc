//
//  spellView.swift
//  Challenge
//
//  Created by Avyan Mehra on 19/8/23.
//

import SwiftUI
struct spellView: View {
    
    @Binding var name: String
    @Binding  var level: Int
    @Binding var who: String
    @Binding var what: String
    @Binding var good: Bool
    
    var body: some View {
        NavigationStack{
            
            List{
                TextField(name, text: $name)
                    .font(.largeTitle)
                
                
                HStack {
                    Text("🔺 Level:")
                        .font(.title3)
                    Stepper(value: $level, in: 1...1000) {
                        Text(String(level))
                    }
                }
                HStack {
                    Text("🕴️Who:")
                        .font(.title3)
                    TextField(who, text: $who)
                }
                HStack {
                    Text("❓What:")
                        .font(.title3)
                    TextField(what, text: $what)
                }
                HStack {
                        Toggle("Is it good?:", isOn: $good)
                }
                
                
                
            }
            
            
            
        }
        .navigationTitle("Spell Editor")
    }
}
struct spellView_Previews: PreviewProvider {
    static var previews: some View {
        spellView( name: .constant(""), level: .constant(0), who: .constant(""), what: .constant(""), good: .constant(false))
    }
}
