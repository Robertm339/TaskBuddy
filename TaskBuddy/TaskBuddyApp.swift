//
//  TaskBuddyApp.swift
//  TaskBuddy
//
//  Created by Robert Martinez on 10/23/23.
//

import SwiftUI

@main
struct TaskBuddyApp: App {
    @StateObject var toDo = ToDoViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(toDo)
        }
    }
}
