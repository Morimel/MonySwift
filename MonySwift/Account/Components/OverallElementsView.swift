//
//  OverallElementsView.swift
//  MonySwift
//
//  Created by Isa Melsov on 14/6/25.
//

import SwiftUI

struct OverallElements: View {
    
    let text: String
    let strokeColor: Color
    let downColor: Color
    let textColor: Color
    let strokeOpacity: Double
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(text)
                .foregroundStyle(.white)
                .font(.title2)
                .fontWeight(.medium)

            // Серый контейнер
            VStack(spacing: 0) {
                // Верхняя строка
                HStack {
                    Text("KGS")
                        .foregroundStyle(.white)
                        .font(.title2)

                    Spacer()

                    Text("3 481 KGS")
                        .foregroundStyle(textColor)
                        .font(.title3)
                        .padding(.vertical, 8)
                }
                .padding()

                // Зелёный блок снизу с нижними скруглениями
                HStack {
                    Spacer()
                    Text("3 481 KGS")
                        .foregroundStyle(textColor)
                        .font(.title2)
                        .padding(.vertical, 4)
                    Spacer()
                }
                .padding(.vertical, 12)
                .background(
                    downColor.opacity(0.1)
                        .clipShape(RoundedCorner(radius: 12, corners: [.bottomLeft, .bottomRight]))
                )
                .overlay(
                    RoundedCorner(radius: 12, corners: [.bottomLeft, .bottomRight])
                        .stroke(strokeColor.opacity(strokeOpacity), lineWidth: 1)
                )
            }
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
            )
        }
        .padding()
    }
}

#Preview {
    OverallElements(text: "text", strokeColor: .red, downColor: .blue, textColor: .green, strokeOpacity: 0.3)
}
