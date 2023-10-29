//
//  ToDoViewModel.swift
//  TaskBuddy
//
//  Created by Robert Martinez on 10/23/23.
//

import Foundation

class ToDoViewModel: ObservableObject {
    @Published var reminders = [Reminder]()
    @Published var title = ""
    @Published var date = Date()
    @Published var tasks = [IndividualTask]()
    
    func save() {
        if let data = try? JSONEncoder().encode(reminders) {
            UserDefaults.standard.set(data, forKey: "Reminder")
        }
        
        if let tasksData = try? JSONEncoder().encode(tasks) {
            UserDefaults.standard.set(tasksData, forKey: "Tasks")
        }
    }
    
    func load() {
        if let data = UserDefaults.standard.data(forKey: "Reminder") {
            if let decoded = try? JSONDecoder().decode([Reminder].self, from: data) {
                reminders = decoded
            }
        }
        
        if let tasksData = UserDefaults.standard.data(forKey: "Tasks") {
            if let tasksDecoded = try? JSONDecoder().decode([IndividualTask].self, from: tasksData) {
                tasks = tasksDecoded
            }
        }
    }
    
    func update() {
        load()
    }
    
    func remove(at offSets: IndexSet) {
        reminders.remove(atOffsets: offSets)
        save()
    }
    
    func newReminder() {
        let newTitle = title.trimmingCharacters(in: .whitespaces)
        let newDate = date
        
        let reminder = Reminder(title: newTitle, dueDate: newDate)
        reminders.insert(reminder, at: 0)
        save()
    }
}
