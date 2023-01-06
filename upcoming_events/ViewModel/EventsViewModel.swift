//
//  Events.swift
//  upcoming_events
//
//  Created by Santos Ramon on 1/5/23.
//

import Foundation

class EventsViewModel: ObservableObject {
    @Published var eventsGroup = [EventGroupModel]()
    
    // Since we are using a Protocol Oriented approach, we can use a mock or a server implementation
    // let eventsAPI: EventsAPIProtocol = EventsAPIServer()
    let eventsAPI: EventsAPIProtocol = EventsAPIMock()

    func loadData(){
        eventsAPI.fetchAll { result in
            switch result {
            case .success(let eventsData):
                let groupedEventsByDate = self.groupByDate(events: eventsData)
                self.eventsGroup = groupedEventsByDate
                
            case .failure(let networkError):
                // TODO: show error message
                print("error", networkError)
            }
        }
    }
    
    private func groupByDate(events: [EventModel]) -> [EventGroupModel] {
        var result = [EventGroupModel]()
        // Sort the array of events by start time
        let sortedEvents = events.sorted { $0.start < $1.start }
        let firstEventDate = sortedEvents.first?.start ?? Date()
        var tempGroup = EventGroupModel(title: firstEventDate.dateDescription(), events: [])
        for i in 0..<sortedEvents.count - 1 {
            var hasOverlap = false
            let nextIndex = i + 1
            let prevIndex = i - 1
            
            // Validates corner case index -1
            if prevIndex >= 0 {
                let prevEvent = sortedEvents[prevIndex]
                // check if there is an overlap with the previous event
                hasOverlap = sortedEvents[i].start < prevEvent.end
            }
            
            // Validates index out of range
            if nextIndex <= sortedEvents.count - 1 {
                let nextEvent = sortedEvents[nextIndex]
                // check if there is an overlap with the next event
                hasOverlap = nextEvent.start < sortedEvents[i].end || hasOverlap
            }
            
            let groupItem = EventGroupItemModel(title: sortedEvents[i].title,
                                                start: sortedEvents[i].start.timeDescription(),
                                                end: sortedEvents[i].end.timeDescription(),
                                                hasOverlap: hasOverlap)

            if tempGroup.title == sortedEvents[i].start.dateDescription() {
                // If the event group exists, then we should append the event to that group
                tempGroup.events.append(groupItem)
            } else {
                result.append(tempGroup)
                // If the event group doesn't exists, we are going to create a new one
                tempGroup = EventGroupModel(title: sortedEvents[i].start.dateDescription(),
                                            events: [])
                tempGroup.events.append(groupItem)
            }
        }
        return result
    }
}
