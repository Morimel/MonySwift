//
//  StatisticsView.swift
//  MonySwift
//
//  Created by Isa Melsov on 6/6/25.
//

import SwiftUI

struct StatisticsView: View {
    var body: some View {
        ZStack {
            Color(.darkBlue)
                .ignoresSafeArea()

            VStack(spacing: 0) {
                TopArea()

                ChooseMonth()
                    .padding(.top)

                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 16) {
                        TurnOver(
                            firstView: ExpensesStatisticsView(),
                            secondView: IncomeStatisticsView()
                        )
                        Spacer(minLength: 40) // чтобы не прилипало
                    }
                    .padding(.bottom, 32)
                    .frame(maxWidth: .infinity, alignment: .top)
                }
                .frame(maxWidth: .infinity)
            }
        }
    }
}

#Preview {
    StatisticsView()
}


