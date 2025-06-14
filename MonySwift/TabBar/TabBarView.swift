//
//  TabBarView.swift
//  MonySwift
//
//  Created by Isa Melsov on 6/6/25.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            
            Tab("Счета", systemImage: "wallet.bifold.fill") {
                AccountView()
            }
            
            Tab("Категории", systemImage: "xmark.triangle.circle.square.fill") {
                CategoriesView()
            }
            
            Tab("Операции", systemImage: "receipt") {
                OperationsView()
            }
            
            Tab("Статистика", systemImage: "chart.bar.xaxis") {
                StatisticsView()
            }
            
            Tab("Больше", systemImage: "circle.grid.3x3") {
                MoreView()
            }
        }
    }
}

#Preview {
    TabBarView()
}
