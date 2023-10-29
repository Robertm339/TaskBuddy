//
//  ReminderDetailView.swift
//  TaskBuddy
//
//  Created by Robert Martinez on 10/27/23.
//

import SwiftUI

struct ReminderDetailView: View {
    var reminder: Reminder
    
    @EnvironmentObject var toDoVM: ToDoViewModel
    @State private var newTaskName = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Title") {
                    Text(reminder.title)
                }
                
                Section("Tasks") {
                    ForEach(toDoVM.tasks, id: \.self) { task in
                        Text(task.name)
                    }
                    
                    HStack {
                        TextField("Add a New Task", text: $newTaskName)
                        
                        Button("Add", action: addTask)
                    }
                }
            }
            .navigationTitle("Details")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    func addTask() {
        guard newTaskName.isEmpty == false else { return }
        
        withAnimation {
//            let task = newTaskName
//            reminder.individualTasks.append(task)
//            newTaskName = ""
            
            let task = IndividualTask(name: newTaskName)
            toDoVM.tasks.append(task)
            newTaskName = ""
            toDoVM.save()
        }
    }
}

#Preview {
    ReminderDetailView(reminder: .example)
        .environmentObject(ToDoViewModel())
}
