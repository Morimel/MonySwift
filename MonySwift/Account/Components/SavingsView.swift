//
//  SavingsView.swift
//  MonySwift
//
//  Created by Isa Melsov on 14/6/25.
//

import SwiftUI

struct SavingsView: View {
    @State private var categories: [Category] = [
        Category(iconName: "sparkles", title: "Для мечты", amount: 0),
    ]
    
    let columns = [
        GridItem(.flexible())
    ]
    
    var body: some View {
        let totalWidth = UIScreen.main.bounds.width - 32
        let itemWidth = totalWidth
        let itemHeight = itemWidth * 0.2
        
        LazyVGrid(columns: columns, spacing: 16) {
            ForEach(categories) { category in
                Categories(category: category, width: itemWidth, height: itemHeight, font: .title2)
            }
            
            Categories(
                category: Category(iconName: "plus", title: "Добавить сберегательные счета", amount: 0),
                width: itemWidth,
                height: itemHeight,
                isAddButton: true
            )
            .onTapGesture {
                print("Добавить доход")
                // тут можно вызвать Sheet или форму
            }
        }
        .padding()
    }
}

#Preview {
    SavingsView()
}
