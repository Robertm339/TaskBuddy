//
//  ToDoView.swift
//  TaskBuddy
//
//  Created by Robert Martinez on 10/23/23.
//

import SwiftUI

struct ToDoView: View {
    @EnvironmentObject var toDoVM: ToDoViewModel
    @State private var showingSheet = false
    
    var reminder: Reminder
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(toDoVM.reminders) { reminder in 
                        NavigationLink {
                            ReminderDetailView(reminder: reminder)
                        } label: {
                            ReminderRowView(reminder: reminder)
                        }
                    }
                    .onDelete(perform: toDoVM.remove)
                }
                .listStyle(.insetGrouped)
            }
            .toolbar {
                Button {
                    showingSheet.toggle()
                } label: {
                    Image(systemName: "plus")
                }
                .sheet(isPresented: $showingSheet) {
                    NewTaskView()
                }
                .onAppear(perform: toDoVM.update)
            }
            .navigationTitle("Reminders")
        }
    }
}

#Preview {
    ToDoView(reminder: .example)
        .environmentObject(ToDoViewModel())
}
