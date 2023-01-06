//
//  EventModel.swift
//  upcoming_events
//
//  Created by Santos Ramon on 1/5/23.
//

import Foundation

struct EventModel: Codable {
    let title: String
    let start: Date
    let end: Date
}

