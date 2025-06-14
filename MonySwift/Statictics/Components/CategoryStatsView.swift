//
//  CategoryStatsView.swift
//  MonySwift
//
//  Created by Isa Melsov on 14/6/25.
//

import SwiftUI

struct CategoryStatRow: View {
    let stat: CategoryStat

    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            // Иконка
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(stat.bgColor)
                    .frame(width: 40, height: 40)
                Image(systemName: stat.icon)
                    .foregroundColor(stat.iconColor)
            }

            // Название + Бар
            VStack(alignment: .leading, spacing: 4) {
                Text(stat.name)
                    .foregroundColor(.white)
                    .font(.system(size: 16))

                // Прогресс-бар
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(.lightBlue)
                        .frame(height: 6)

                    GeometryReader { geo in
                        RoundedRectangle(cornerRadius: 4)
                            .fill(stat.iconColor)
                            .frame(width: geo.size.width * CGFloat(stat.percent / 100), height: 6)
                    }
                    .frame(height: 6)
                }
            }

            Spacer()

            // Сумма и %
            VStack(alignment: .trailing) {
                Text("\(stat.amount) KGS")
                    .foregroundColor(.white)
                    .font(.system(size: 14))
                Text("\(Int(stat.percent)) %")
                    .foregroundColor(.white)
                    .font(.system(size: 12))
            }
        }
        .padding(.horizontal)
    }
}

struct CategoryStatListView: View {
    let stats: [CategoryStat]

    var body: some View {
        VStack(spacing: 16) {
            ForEach(stats) { item in
                CategoryStatRow(stat: item)
            }
        }
        .padding(.vertical)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
        )
        .padding(.horizontal)
    }
}

#Preview {
    CategoryStatListView(stats: [CategoryStat(icon: "gear", iconColor: .lightBlue, bgColor: .darkBlue, name: "Settings", amount: 100, percent: 3)])
}
