//
//  Emoji.swift
//  Emoji WidgetUI
//
//  Created by Ahmet Emin Kara on 9.02.2022.
//

import Foundation

struct Emoji: Identifiable,Codable {
    var id:UUID = UUID()
    
    let icon:String
    let name:String
}

extension Emoji{
    static let exampleList:[Emoji] = [
        Emoji(icon: "happy", name: "Happy"),
        Emoji(icon: "stare", name: "Stare"),
        Emoji(icon: "wonder", name: "Wonder"),
        Emoji(icon: "angry" , name: "Angry")
        
    ]
}
