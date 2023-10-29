//
//  NewTaskView.swift
//  TaskBuddy
//
//  Created by Robert Martinez on 10/23/23.
//

import SwiftUI

struct NewTaskView: View {
    @EnvironmentObject var toDoVM: ToDoViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Section("New Task") {
                        TextField("Title", text: $toDoVM.title)
                        DatePicker("Reminder Date", selection: $toDoVM.date, displayedComponents: [.date, .hourAndMinute])
                            .labelsHidden()
                    }
                    
                    Section("Confirm") {
                        Button("Add Task") {
                            toDoVM.newReminder()
                            done()
                            
                            toDoVM.title = ""
                            toDoVM.date = Date.now
                        }
                        .disabled(toDoVM.title.isEmpty)
                    }
                }
                .onAppear(perform: toDoVM.update)
            }
            .toolbar {
                Button("Done") {
                 done()
                }
            }
        }
    }
    
    func done() {
        dismiss()
    }
}

#Preview {
    NewTaskView()
        .environmentObject(ToDoViewModel())
}
