//
//  AccountCollectionViewView.swift
//  MonySwift
//
//  Created by Isa Melsov on 14/6/25.
//

import SwiftUI

struct AccountsViewCollection: View {
    let categories: [Category] = [
        Category(iconName: "wallet.bifold.fill", title: "Карта", amount: 1400),
    ]
    
    let columns = [
        GridItem(.flexible()),
    ]
    
    var body: some View {
        let totalWidth = UIScreen.main.bounds.width - 32
        let itemWidth = totalWidth
        let itemHeight = itemWidth * 0.2
        
        LazyVGrid(columns: columns, spacing: 16) {
            ForEach(categories) { category in
                Categories(category: category, width: itemWidth, height: itemHeight, color: .green, font: .title2)
            }
            
            Categories(
                category: Category(iconName: "plus", title: "Добавить финансовый счет", amount: 0),
                width: itemWidth,
                height: itemHeight,
                isAddButton: true
            )
            .onTapGesture {
                print("Открыть форму добавления категории")
                // Здесь можешь показать Sheet / Navigation или что хочешь
            }
        }
        .padding()
    }
}

#Preview {
    AccountsViewCollection()
}
