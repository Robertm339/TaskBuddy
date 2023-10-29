//
//  ReminderRowView.swift
//  TaskBuddy
//
//  Created by Robert Martinez on 10/27/23.
//

import SwiftUI

struct ReminderRowView: View {
    let reminder: Reminder
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(reminder.title)
                    .font(.system(size: 16, weight: .semibold))
                    .padding(.bottom, 4)
                
                HStack {
                    Text("Due Date")
                        .font(.system(size: 16, weight: .semibold))
                    
                    Text("\(formatTaskDate(Date()))")
                        .font(.system(size: 16, weight: .semibold))
                }
                .foregroundStyle(.gray)
            }
        }
    }
    
    func formatTaskDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yy"
        return dateFormatter.string(from: date)
    }
}

#Preview {
    ReminderRowView(reminder: .example)
}
