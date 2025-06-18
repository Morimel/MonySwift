//
//  TurnOverView.swift
//  MonySwift
//
//  Created by Isa Melsov on 14/6/25.
//

import SwiftUI

struct TurnOver<First: View, Second: View>: View {
    @State private var selectedTab: String = "Расходы"
    let firstView: First
    let secondView: Second

    var body: some View {
        VStack(spacing: 16) {
            // Только верхняя панель в GeometryReader (для гибкости)
            GeometryReader { geometry in
                let tabHeight = geometry.size.height * 0.8
                let tabWidth = geometry.size.width
                ZStack {
                    Color(.lightBlue)
                        .cornerRadius(12)
                    HStack(spacing: 16) {
                        TurnOverTexts(
                            text: "Расходы",
                            color: .red,
                            selectedTab: $selectedTab,
                            width: tabWidth * 0.4,
                            height: tabHeight * 1.05
                        )
                        TurnOverTexts(
                            text: "Доходы",
                            color: .green,
                            selectedTab: $selectedTab,
                            width: tabWidth * 0.4,
                            height: tabHeight * 1.05
                        )
                    }
                    .frame(maxWidth: .infinity)
                }
                .frame(height: 120)
                .padding()
            }
            .frame(height: 120) // фиксированная высота только для шапки

            // Контент растёт по размеру
            if selectedTab == "Расходы" {
                firstView
            } else {
                secondView
            }
        }
    }
}



struct TurnOverTexts: View {
    var text: String
    var color: Color
    @Binding var selectedTab: String
    var width: CGFloat
    var height: CGFloat
    
    var isSelected: Bool {
        selectedTab == text
    }
    
    var body: some View {
        VStack {
            Text(text)
                .font(.headline)
                .foregroundStyle(.white)
            Text("0 KGS")
                .foregroundStyle(color)
                .font(.largeTitle)
        }
        .frame(width: width, height: height)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(isSelected ? .darkBlue : .lightBlue)
        )
        .onTapGesture {
            selectedTab = text
        }
    }
}

#Preview {
    StatefulPreviewWrapper(false) { isNavigating in
        TurnOver(
            firstView: IncomeView(),
            secondView: ExpenseView(isNavigating: isNavigating)
        )
    }
}

