//
//  EventsAPIServer.swift
//  upcoming_events
//
//  Created by Santos Ramon on 1/5/23.
//

import Foundation

class EventsAPIServer: EventsAPIProtocol {
    func fetchAll(completion: @escaping (Result<[EventModel], NetworkError>) -> Void) {
        // TODO: To be implemented when the server side is done
        completion(.success([]))
    }
}
