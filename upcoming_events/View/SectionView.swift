//
//  EventsView.swift
//  upcoming_events
//
//  Created by theforce on 1/4/23.
//

import SwiftUI

struct SectionView: View {
    @ObservedObject var viewModel: EventsViewModel
    
    var body: some View {
        List(viewModel.events){ eventGroupModel in
            EventGroupView(model: eventGroupModel)
        }
        .listStyle(.insetGrouped)
    }
}
