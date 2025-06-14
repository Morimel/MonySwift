//
//  NotEmptyView.swift
//  MonySwift
//
//  Created by Isa Melsov on 14/6/25.
//

import SwiftUI

struct NotEmptyView: View {
    
    let date = Date()
    
    var body: some View {
        VStack {
            HStack {
                let dateString = formattedDate.string(from: date)
                let parts = dateString.split(separator: " ")
                Text(String(parts[0])) // 28
                    .font(.system(size: 36, weight: .bold))
                VStack(alignment: .leading) {
                    Text("\(parts[1])") // понедельник
                        .font(.headline)
                    
                    Text("\(parts[2]) \(parts[3])") // апреля 2025
                        .font(.headline)
                }
                
                Spacer()
                
                Text("- \(200) KGS")
                    .font(.title3)
                    .foregroundStyle(.red)
                
            }
            .padding(.horizontal)
            .foregroundStyle(.white)
            
            Divider()
                .frame(height: 1)
                .background(Color(UIColor.gray))
                .padding(.horizontal)
                .offset(y: -16)
            
            CategoryOperation()
        }
        
        Spacer()
    }
    
    var formattedDate: DateFormatter {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru_RU") // Русский
        formatter.dateFormat = "d EEEE MMMM yyyy" // 28 понедельник апреля 2025
        return formatter
    }
}

#Preview {
    NotEmptyView()
}
