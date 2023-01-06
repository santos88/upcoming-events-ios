//
//  Extensions.swift
//  upcoming_events
//
//  Created by Santos Ramon on 1/5/23.
//

import Foundation

extension Date {
    func dateDescription() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM d, yyyy"
        return dateFormatter.string(from: self)
    }
    
    func timeDescription() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: self)
    }
}
