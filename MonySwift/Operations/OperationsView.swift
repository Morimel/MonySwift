//
//  OperationsView.swift
//  MonySwift
//
//  Created by Isa Melsov on 6/6/25.
//

import SwiftUI

struct OperationsView: View {
    var body: some View {
        ZStack {
            Color(.darkBlue)
                .ignoresSafeArea()
            
            VStack {
                TopArea()
                ChooseMonth()
                // EmptyView()
                NotEmptyView()
            }
            // Кнопка в нижнем правом углу
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        print("Добавить нажато")
                    }) {
                        HStack(spacing: 8) {
                            Image(systemName: "plus")
                                .font(.system(size: 20, weight: .bold))
                            Text("Добавить")
                                .font(.system(size: 20, weight: .semibold))
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 16)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                        .shadow(radius: 4)
                    }
                    .padding(.trailing, 24)
                    .padding(.bottom, 24)
                }
            }
        }
    }
}

#Preview {
    OperationsView()
}
