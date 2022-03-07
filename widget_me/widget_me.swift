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
        SimpleEntry(date: Date(), imageID: "EXAWER")
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), imageID: "EXAWER")
        completion(entry)
    }

    
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
            var entries: [SimpleEntry] = []

            // Generate a timeline consisting of five entries an hour apart, starting from the current date.
            
            let currentDate = Date()
            
            let imageIds = ["EXAWER", "RISE AND SHINE", "INNER PARTY"]
            
            // testing for 5 seconds
            let timeRangeInSecond = 5
            
            for index in 0 ..< imageIds.count {
                
                let entryDate = Calendar.current.date(byAdding: .second, value: index * timeRangeInSecond, to: currentDate)!
                
                let entry = SimpleEntry(date: entryDate, imageID: imageIds[index])
                
                entries.append(entry)
            }
            
            let timeline = Timeline(entries: entries, policy: .atEnd)
            completion(timeline)
        }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let imageID: String?
}

struct widget_meEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        
        VStack(alignment: .center) {
            Text("")
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay(
           
            Text(entry.imageID!).font(.system(size: 22, weight: .bold)).foregroundColor(Color(#colorLiteral(red: 0.23, green: 0.45, blue: 0.56, alpha: 1))).padding().brightness(-0.3).frame( alignment: .center), alignment: .topLeading
            
        ).background{
            Image(entry.imageID!)
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
        widget_meEntryView(entry: SimpleEntry(date: Date(),  imageID: "EXAWER"))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
