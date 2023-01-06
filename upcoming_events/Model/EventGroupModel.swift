//
//  EventGroupModel.swift
//  upcoming_events
//
//  Created by Santos Ramon on 1/5/23.
//

import Foundation

struct EventGroupModel: Identifiable {
    var id = UUID()
    var title: String
    var events: [EventGroupItemModel]
}

struct EventGroupItemModel: Identifiable {
    let id = UUID()
    let title: String
    let start: String
    let end: String
    let hasOverlap: Bool
}
