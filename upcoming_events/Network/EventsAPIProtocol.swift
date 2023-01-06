//
//  Network.swift
//  upcoming_events
//
//  Created by Santos Ramon on 1/5/23.
//

import Foundation

protocol EventsAPIProtocol {
    func fetchAll(completion: @escaping (Result<[EventModel], NetworkError>) -> Void)
}
