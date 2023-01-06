//
//  EventsAPIMock.swift
//  upcoming_events
//
//  Created by Santos Ramon on 1/5/23.
//

import Foundation

class EventsAPIMock: EventsAPIProtocol {
    func fetchAll(completion: @escaping (Result<[EventModel], NetworkError>) -> Void) {
        guard let url = Bundle.main.url(forResource: "mock", withExtension: "json")
        else {
            completion(.failure(.notFound))
            return
        }

        do {
            let data = try Data(contentsOf: url)
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMMM d, yyyy h:mm a"
            dateFormatter.locale = Locale(identifier: "en_us")
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .formatted(dateFormatter)
            let events = try decoder.decode([EventModel].self, from: data)
            completion(.success(events))
            return
        } catch {
            completion(.failure(.unknown))
            return
        }
    }
}
