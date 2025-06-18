//
//  IncomesExpensesView.swift
//  MonySwift
//
//  Created by Isa Melsov on 14/6/25.
//

import SwiftUI

struct ExpenseView: View {
    @Binding var isNavigating: Bool

    let categories: [Category] = [
        Category(iconName: "cart", title: "Продукты", amount: 1400),
        Category(iconName: "house", title: "Аренда", amount: 8000),
        Category(iconName: "wifi", title: "Интернет", amount: 450),
        Category(iconName: "gamecontroller", title: "Развлечения", amount: 1200),
        Category(iconName: "car.fill", title: "Транспорт", amount: 670),
        Category(iconName: "fork.knife", title: "Рестораны", amount: 2900),
        Category(iconName: "gear", title: "Техника", amount: 5900)
    ]

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        let totalWidth = UIScreen.main.bounds.width - 32
        let itemWidth = (totalWidth - 16) / 2
        let itemHeight = itemWidth * 0.4

        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(categories) { category in
                    Categories(category: category, width: itemWidth, height: itemHeight)
                }

                Categories(
                    category: Category(iconName: "plus", title: "Добавить", amount: 0),
                    width: itemWidth,
                    height: itemHeight,
                    isAddButton: true
                )
                .onTapGesture {
                    isNavigating = true
                }
            }
            .padding()
        }
    }
}


struct IncomeView: View {
    @State private var categories: [Category] = [
        Category(iconName: "creditcard", title: "Зарплата", amount: 25000),
    ]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        let totalWidth = UIScreen.main.bounds.width - 32
        let itemWidth = (totalWidth - 16) / 2
        let itemHeight = itemWidth * 0.4
        
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(categories) { category in
                    Categories(category: category, width: itemWidth, height: itemHeight)
                }
                
                // Кнопка "Добавить"
                Categories(
                    category: Category(iconName: "plus", title: "Добавить", amount: 0),
                    width: itemWidth,
                    height: itemHeight,
                    isAddButton: true
                )
                .onTapGesture {
                    //                    isNavigating = true
                    print("fd")
                }
            }
            .padding()
        }
    }
}

#Preview {
    StatefulPreviewWrapper(false) { isNavigating in
        ExpenseView(isNavigating: isNavigating)
    }
}

