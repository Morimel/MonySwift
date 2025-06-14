//
//  IncomeExpensesView.swift
//  MonySwift
//
//  Created by Isa Melsov on 14/6/25.
//

import SwiftUI

struct ExpensesStatisticsView: View {
    let values: [Double] = (1...30).map { _ in Double.random(in: 1...200_000) }
    
    let chartData: [DonutSegmentData] = [
        DonutSegmentData(color: .red, value: 35),
        DonutSegmentData(color: .pink, value: 25),
        DonutSegmentData(color: .blue, value: 10),
        DonutSegmentData(color: .brown, value: 5),
        DonutSegmentData(color: .cyan, value: 5),
        DonutSegmentData(color: .purple, value: 10)
    ]
    
    let stats = [
        CategoryStat(icon: "cart", iconColor: .purple, bgColor: .purple.opacity(0.2), name: "Еда", amount: 15800, percent: 32),
        CategoryStat(icon: "heart.fill", iconColor: .orange, bgColor: .orange.opacity(0.2), name: "Девушка", amount: 15401, percent: 32),
        CategoryStat(icon: "fork.knife", iconColor: .pink, bgColor: .pink.opacity(0.2), name: "Кафе", amount: 10123, percent: 21),
        CategoryStat(icon: "gamecontroller", iconColor: .blue, bgColor: .blue.opacity(0.2), name: "Подписки", amount: 2790, percent: 5),
        CategoryStat(icon: "person", iconColor: .brown, bgColor: .brown.opacity(0.2), name: "Для себя", amount: 1895, percent: 3),
        CategoryStat(icon: "bus", iconColor: .cyan, bgColor: .cyan.opacity(0.2), name: "Транспорт", amount: 1725, percent: 3),
        CategoryStat(icon: "person.3.fill", iconColor: .red, bgColor: .red.opacity(0.2), name: "Семья", amount: 160, percent: 0)
    ]
    
    var body: some View {
        VStack(spacing: 16) {
            MoneyStream()
                .padding(.top)
            
            VStack(alignment: .leading, spacing: 4) {
                VStack(spacing: 8) {
                    BarChartUIKit(values: values)
                        .frame(height: 250)
                    
                    HStack {
                        Text("1 июн")
                            .font(.system(size: 12))
                            .foregroundColor(.gray)
                        Spacer()
                        Text("30 июн")
                            .font(.system(size: 12))
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal, 12)
                    .padding(.bottom, 8)
                }
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                        .background(RoundedRectangle(cornerRadius: 16).fill(Color.clear))
                )
                .padding(.horizontal)
            }
            
            AverageExpense()
            
            DynamicDonutChart(segments: chartData, lineWidth: 30)
                            .padding()
            
            CategoryStatListView(stats: stats)
        }
    }
}


struct IncomeStatisticsView: View {
    var body: some View {
        Text("IncomeStatisticsView")
    }
}

#Preview {
    ExpensesStatisticsView()
}
