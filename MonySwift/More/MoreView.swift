//
//  MoreView.swift
//  MonySwift
//
//  Created by Isa Melsov on 6/6/25.
//

import SwiftUI

struct MoreView: View {
    var body: some View {
        NavigationStack {
            
            
            ZStack(alignment: .top) {
                Color(.darkBlue)
                    .ignoresSafeArea()
                
                VStack(alignment: .leading) {
                    
                    HStack {
                        Image(systemName: "dollarsign")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .foregroundStyle(.white)
                        
                        Text("Mony")
                            .font(.system(size: 44, weight: .bold, design: .default))
                            .foregroundStyle(.white)
                    }
                    .padding(.leading, 4)
                    
                    DividerCustom()
                        .padding(.top, -16)
                    
                    NavigationLink(destination: PlannedPaymentsView()) {
                        OptionSegment(iconName: "calendar", text: "Запланированные платежи")
                    }
                    
                    
                    OptionSegment(iconName: "calendar", text: "Бюджеты")
                    
                    DividerCustom()
                    
                    OptionSegment(iconName: "gearshape", text: "Настройки")
                    
                    OptionSegment(iconName: "server.rack", text: "Данные")
                    
                    DividerCustom()
                    
                    OptionSegment(iconName: "play.rectangle", text: "Видеоинструкции")
                    
                }
            }
        }
    }
}

#Preview {
    MoreView()
}
