//
//  EventGroupView.swift
//  upcoming_events
//
//  Created by Santos Ramon on 1/5/23.
//

import SwiftUI

struct EventGroupView: View {
    var eventGroupModel: EventGroupModel
    
    init(model: EventGroupModel) {
        self.eventGroupModel = model
    }
    
    var body: some View {
        Section(header: header){
            ForEach(eventGroupModel.events) { event in
                EventView(model: event)
            }
        }
    }
    
    @ViewBuilder
    var header: some View {
        Text(eventGroupModel.title)
        .font(.title2)
        .fontWeight(.heavy)
    }
    
}
