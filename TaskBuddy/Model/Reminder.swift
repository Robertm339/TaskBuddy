//
//  ToDo.swift
//  TaskBuddy
//
//  Created by Robert Martinez on 10/23/23.
//

import Foundation

struct Reminder: Identifiable, Codable {
    var id = UUID()
    let title: String
    let dueDate: Date
    var individualTasks = [String]()

    static let example = Reminder(title: "Testing Reminder", dueDate: Date.now)
}
