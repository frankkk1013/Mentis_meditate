//
//  widget_me.swift
//  widget_me
//
//  Created by Francesco Iaccarino on 04/03/22.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct widget_meEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        
        VStack(alignment: .center) {
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay(
           
            Text("EXAWER").font(.system(size: 22, weight: .bold)).foregroundColor(Color(#colorLiteral(red: 0.23, green: 0.45, blue: 0.56, alpha: 1))).padding().brightness(-0.3).frame( alignment: .center), alignment: .topLeading
            
        ).background{
            Image("EXAWER")
            .resizable()
            .aspectRatio(contentMode: .fill)
            
            
        }
        
    }
}

@main
struct widget_me: Widget {
    let kind: String = "widget_me"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            widget_meEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct widget_me_Previews: PreviewProvider {
    static var previews: some View {
        widget_meEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
