//
//  ContentView.swift
//  MonySwift
//
//  Created by Isa Melsov on 5/6/25.
//

import SwiftUI

struct CategoriesView: View {
    var body: some View {
        ZStack {
            Color(.darkBlue)
                .ignoresSafeArea()
            VStack {
                TopArea()
                
                ChooseMonth()
                
                TurnOver(firstView: ExpenseView(), secondView: IncomeView())
                
                Spacer()
            }
        }
    }
}

#Preview {
    CategoriesView()
}
