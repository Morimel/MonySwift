//
//  AccountHeaderView.swift
//  MonySwift
//
//  Created by Isa Melsov on 14/6/25.
//

import SwiftUI

struct AccountHeader: View {
    let title: String
    let titleColor: Color
    let anountColor: Color
    let amount: Int
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundStyle(titleColor)
                .font(.system(size: 16, weight: .light))
            
            Spacer()
            
            Text("\(amount) KGS")
                .font(.title3)
                .foregroundStyle(anountColor)
        }
        .padding(.horizontal)
    }
}

#Preview {
    AccountHeader(title: "food", titleColor: .red, anountColor: .green, amount: 543)
}
