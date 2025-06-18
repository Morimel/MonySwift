//
//  ContentView.swift
//  MonySwift
//
//  Created by Isa Melsov on 5/6/25.
//

import SwiftUI

struct CategoriesView: View {
    @State private var isNavigating = false

    var body: some View {
        NavigationStack {
            ZStack {
                Color(.darkBlue)
                    .ignoresSafeArea()
                VStack {
                    TopArea()
                    ChooseMonth()
                    TurnOver(
                        firstView: ExpenseView(isNavigating: $isNavigating),
                        secondView: IncomeView()
                    )

                    Spacer()
                }
            }
            .navigationDestination(isPresented: $isNavigating) {
                AddCategory()
            }
        }
    }
}


#Preview {
    CategoriesView()
}
