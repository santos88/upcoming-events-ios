//
//  ContentView.swift
//  upcoming_events
//
//  Created by Santos Ramon on 1/5/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = EventsViewModel()
    
    var body: some View {
        VStack {
            Text("Upcoming Events")
                .font(.title)
                .fontWeight(.bold)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            List(viewModel.eventsGroup){ eventGroupModel in
                EventGroupView(model: eventGroupModel)
            }
            .scrollContentBackground(.hidden)
            .onAppear {
                viewModel.loadData()
            }
        .listStyle(.sidebar)
        }
        .background(Theme.background.edgesIgnoringSafeArea(.all))
    }
}
