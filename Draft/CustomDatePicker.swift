//
//  CustomCalendarView.swift
//  MonySwift
//
//  Created by Isa Melsov on 16/6/25.
//

import SwiftUI

struct CustomDatePicker: View {
    
    @State var currentMonthDate: Date = Date()
    
    @State var selectedDate: Date? = nil
    
    var body: some View {
        
        ZStack {
            Color(.lightBlue)
            VStack(spacing: 35) {
                
                let days: [String] = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
                
                let monthAndYear = getMonthAndYear(from: currentMonthDate)
                
                HStack(spacing: 20) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text(monthAndYear?.month ?? "Month")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                        
                        Text(monthAndYear?.year ?? "Year")
                            .font(.title.bold())
                            .foregroundStyle(.white)
                    }
                    
                    Spacer()
                    
                    Button {
                        withAnimation {
                            currentMonthDate = Calendar.current.date(byAdding: .month, value: -1, to: currentMonthDate) ?? currentMonthDate
                        }
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(.title2)
                            .foregroundStyle(.white)
                    }
                    
                    Button {
                        withAnimation {
                            currentMonthDate = Calendar.current.date(byAdding: .month, value: 1, to: currentMonthDate) ?? currentMonthDate
                        }
                    } label: {
                        Image(systemName: "chevron.right")
                            .font(.title2)
                            .foregroundStyle(.white)
                    }
                }
                .padding(.horizontal)
                
                
                HStack(spacing: 0) {
                    ForEach(days, id: \.self) { day in
                        Text(day)
                            .font(.callout)
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .foregroundStyle(.white)
                    }
                }
                
                let columns = Array(repeating: GridItem(.flexible()), count: 7)
                
                LazyVGrid(columns: columns, spacing: 15) {
                    ForEach(extractDate()) { value in
                        if value.isPlaceholder {
                            Text("")
                                .frame(maxWidth: .infinity)
                        } else {
                            Button {
                                selectedDate = value.date
                            } label: {
                                Text("\(value.day)")
                                    .font(.title3.bold())
                                    .frame(maxWidth: .infinity, minHeight: 40)
                                    .padding(4)
                                    .background(
                                        Circle()
                                            .fill(selectedDate?.isSameDay(as: value.date) == true ? Color.blue : .clear)
                                    )
                                    .foregroundStyle(selectedDate?.isSameDay(as: value.date) == true ? Color.lightBlue : .white)
                            }
                        }
                    }
                }
            }
        }
    }
    
    func getMonthAndYear(from date: Date) -> (month: String, year: String)? {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US") // или "ru_RU" если нужен русский
        formatter.dateFormat = "YYYY MMMM"
        
        let formattedDate = formatter.string(from: date)
        let components = formattedDate.components(separatedBy: " ")
        
        guard components.count == 2 else { return nil }
        
        return (month: components[0], year: components[1])
    }
    
    
    func extractDate() -> [DateValue] {
        let calendar = Calendar.current
        let currentMonthDates = currentMonthDate.getAllDates()
        
        guard let firstDate = currentMonthDates.first else { return [] }
        
        let firstWeekday = calendar.component(.weekday, from: firstDate)
        
        var dates: [DateValue] = []
        
        // Добавляем пустые ячейки до первого дня месяца
        for _ in 1..<firstWeekday {
            dates.append(DateValue(day: -1, date: Date(), isPlaceholder: true))
        }
        
        // Добавляем реальные даты
        for date in currentMonthDates {
            let day = calendar.component(.day, from: date)
            dates.append(DateValue(day: day, date: date))
        }
        
        return dates
    }
    
    
    
}

#Preview {
    CustomDatePicker()
}

extension Date {
    func getAllDates() -> [Date] {
        let calendar = Calendar.current
        
        guard let startDate = calendar.date(from: calendar.dateComponents([.year, .month], from: self)),
              let range = calendar.range(of: .day, in: .month, for: startDate) else {
            return []
        }
        
        return range.compactMap { day -> Date? in
            return calendar.date(byAdding: .day, value: day - 1, to: startDate)
        }
    }
    
    func isSameDay(as other: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.isDate(self, inSameDayAs: other)
    }
    
}


