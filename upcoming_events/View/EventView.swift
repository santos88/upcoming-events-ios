//
//  EventView.swift
//  upcoming_events
//
//  Created by Santos Ramon on 1/5/23.
//

import SwiftUI

struct EventView: View {
    var eventModel: EventGroupItemModel
    var hasOverlapMarked: CGFloat
    var hasOverlapColor: Color
    
    init(model: EventGroupItemModel) {
        self.eventModel = model
        self.hasOverlapMarked = eventModel.hasOverlap ? 0 : 20
        self.hasOverlapColor = eventModel.hasOverlap ? .red : .white
    }
    
    var body: some View {
        HStack(spacing: 0) {
            Divider()
                .frame(width: 10)
                .background(hasOverlapColor)
                .padding(.trailing, 16)
            HStack {
                Text(eventModel.title)
                    .multilineTextAlignment(.leading)
                    .font(.title2)
                Spacer()
            }
            .frame(width: 130)
            .padding(.vertical, 16)
            
            VStack(alignment: .leading) {
                HStack {
                    Text("Start")
                        .font(.title3)
                    Text(eventModel.start)
                        .font(.title2)
                        .fontWeight(.heavy)
                        .lineLimit(1)
                }
                HStack {
                    Text("End")
                        .font(.title3)
                    Text(eventModel.end)
                        .font(.title2)
                        .fontWeight(.heavy)
                        .lineLimit(1)
                }
            }
            .padding(16)
        }
        .listRowInsets(
            EdgeInsets(top: hasOverlapMarked, leading: 0, bottom: hasOverlapMarked, trailing: 20))
    }
}
