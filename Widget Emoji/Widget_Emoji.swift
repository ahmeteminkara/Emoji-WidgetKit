//
//  Widget_Emoji.swift
//  Widget Emoji
//
//  Created by Ahmet Emin Kara on 9.02.2022.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: TimelineProvider {
    
    typealias Entry = SimpleEntry
    
    
    @AppStorage("emoji", store: UserDefaults(suiteName: "group.com.ahmet.Emoji-WidgetUI"))
    var emojiData: Data = Data()
    
    func placeholder(in context: Context) -> SimpleEntry {
        return SimpleEntry(date: Date(), emoji: Emoji.exampleList.first!)
    }
    
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        
        if let data = try? JSONDecoder().decode(Emoji.self, from: emojiData) {
            let entry = SimpleEntry(date: Date(), emoji: data)
            completion(entry)
        }
        
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        if let data = try? JSONDecoder().decode(Emoji.self, from: emojiData) {
            let entry = SimpleEntry(date: Date(), emoji: data)
            let timeline = Timeline(entries: [entry], policy: .atEnd)
            completion(timeline)
        }
        
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let emoji: Emoji
}

struct Widget_EmojiEntryView : View {
    
    var entry: Provider.Entry
    @Environment(\.widgetFamily) var family: WidgetFamily
    @ViewBuilder
    var body: some View {
        switch family {
        case .systemLarge:
            VStack(alignment: .center, spacing: 20, content: {
                Image(entry.emoji.icon)
                    .resizable()
                    .scaledToFit()
                    .frame(
                        width: UIScreen.w*0.4, height: UIScreen.w*0.4,
                        alignment: .center)
                    
                Text(entry.emoji.name).font(.largeTitle)
                
            })
        case .systemMedium:
            HStack( content: {
                
                Image(entry.emoji.icon)
                    .resizable()
                    .scaledToFit()
                    .frame(
                        width: UIScreen.w*0.3, height: UIScreen.w*0.3,
                        alignment: .center)
                    .padding(20)
                    
                Text(entry.emoji.name).font(.largeTitle)
                Spacer()
            })
        default:
            
            Group {
                Image(entry.emoji.icon)
                    .resizable()
                    .scaledToFit()
                    .frame(
                        width: UIScreen.w*0.3, height: UIScreen.w*0.3,
                        alignment: .center)
            }
            .frame(width: UIScreen.w, height: UIScreen.h, alignment: .center)
            .background(entry.emoji.icon == "angry" ? Color.init("red"): Color.init("yellow"))
            
        }
    }
}


@main
struct Widget_Emoji: Widget {
    let kind: String = "Widget_Emoji"
    
    var body: some WidgetConfiguration {
        
        StaticConfiguration(kind: kind, provider: Provider()) {  entry in
            Widget_EmojiEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct Widget_Emoji_Previews: PreviewProvider {
    static var previews: some View {
        Widget_EmojiEntryView(entry: SimpleEntry(date: Date(), emoji: Emoji.exampleList.last!))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
// */
