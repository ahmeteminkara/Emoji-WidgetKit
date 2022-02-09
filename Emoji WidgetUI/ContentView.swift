//
//  ContentView.swift
//  Emoji WidgetUI
//
//  Created by Ahmet Emin Kara on 9.02.2022.
//

import SwiftUI
import WidgetKit

struct ContentView: View {
    
    @State var selectedEmoji:String = ""
    
    @AppStorage("emoji", store: UserDefaults(suiteName: "group.com.ahmet.Emoji-WidgetUI"))
    var emojiData: Data = Data()
    
    var body: some View {
        VStack( spacing: 10) {
            ForEach(Emoji.exampleList){ emoji in
                
                
                Group {
                    ZStack(
                        alignment: Alignment(horizontal: .center, vertical: .center),
                        content: {
                            RoundedRectangle(cornerRadius: 13)
                                .fill(selectedEmoji == emoji.icon ? Color.gray:Color.clear)
                            EmojiView(emoji: emoji, isVertical: true)
                                .padding(
                                    EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                        })
                        .onTapGesture {save(emoji)}
                }.frame(width: UIScreen.w * 0.5, alignment: .center)
                
                
            }
        }
    }
    
    func save(_ emoji:Emoji) {
        print("save \(emoji)")
        
        guard let emojiData = try? JSONEncoder().encode(emoji) else { return }
        self.emojiData = emojiData
        selectedEmoji = emoji.icon
        WidgetCenter.shared.reloadTimelines(ofKind: "Widget_Emoji")
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
