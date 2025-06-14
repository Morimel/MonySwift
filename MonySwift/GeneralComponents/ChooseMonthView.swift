//
//  ChooseMonthView.swift
//  MonySwift
//
//  Created by Isa Melsov on 14/6/25.
//

import SwiftUI

struct ChooseMonth: View {
    var body: some View {
        HStack {
            Image("arrow_left")
            Button(action: {
                print("Клик!")
            }) {
                HStack {
                    Text("Июнь 2025")
                    Image("arrow_down")
                }
                .font(.headline)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .cornerRadius(12)
            }
            .padding(.horizontal)
            
            Image("arrow_right")
        }
        .padding(.horizontal)
    }
}

#Preview {
    ChooseMonth()
}
