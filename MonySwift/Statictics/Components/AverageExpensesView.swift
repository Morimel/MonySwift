//
//  AverageExpensesView.swift
//  MonySwift
//
//  Created by Isa Melsov on 14/6/25.
//

import SwiftUI

struct AverageExpense: View {
    @Environment(\.horizontalSizeClass) var hSizeClass
    var body: some View {
        let height: CGFloat = hSizeClass == .regular ? 220 : 120
        
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                .frame(width: .infinity, height: height)
                .padding(.horizontal)
            
            VStack(spacing: 8) {
                Text("Среднее значение")
                    .foregroundStyle(.white)
                    .font(.title3)
                
                HStack {
                    Text("День")
                        .foregroundStyle(.white)
                        .font(.title3)
                    
                    Spacer()
                    
                    Text("\(452) KGS")
                        .foregroundStyle(.white)
                        .font(.title3)
                }
                .padding(.horizontal, 32)
                
                HStack {
                    Text("Неделя")
                        .foregroundStyle(.white)
                        .font(.title3)
                    
                    Spacer()
                    
                    Text("\(5432) KGS")
                        .foregroundStyle(.white)
                        .font(.title3)
                }
                .padding(.horizontal, 32)
            }
        }
    }
}

#Preview {
    AverageExpense()
}
