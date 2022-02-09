//
//  EmojiView.swift
//  Emoji WidgetUI
//
//  Created by Ahmet Emin Kara on 9.02.2022.
//

import SwiftUI

struct EmojiView: View {
    let emoji:Emoji
    let isVertical: Bool
    
    
    var body: some View {
        
        if isVertical {
            
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 5, content: {
                
                Image(emoji.icon)
                
                Text(emoji.name).font(.largeTitle)
            })
            
        } else {
            
            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 20, content: {
                
                Image(emoji.icon)                
                Text(emoji.name).font(.largeTitle)
            })
        }
        
    }
}

extension UIScreen{
    static let w = UIScreen.main.bounds.size.width
    static let h = UIScreen.main.bounds.size.height
    
}

struct EmojiView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiView(emoji: Emoji.exampleList.first!,isVertical: true).previewLayout(.sizeThatFits)
    }
}
