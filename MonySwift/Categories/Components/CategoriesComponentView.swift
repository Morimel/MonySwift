//
//  CategoriesView.swift
//  MonySwift
//
//  Created by Isa Melsov on 14/6/25.
//

import SwiftUI

struct Categories: View {
    let category: Category
    let width: CGFloat
    let height: CGFloat
    var color: Color = .gray
    var font: Font = .subheadline
    var isAddButton: Bool = false

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: category.iconName)
                .font(.title2)

            VStack(alignment: .leading, spacing: 4) {
                if !isAddButton {
                    Text(category.title)
                        .font(.headline)
                        .foregroundStyle(Color(UIColor.systemGray5))
                    
                    Text("\(Int(category.amount)) KGS")
                        .font(font)
                        .foregroundColor(color)
                } else {
                    Text(category.title)
                        .font(.headline)
                        .foregroundStyle(.gray)
                }
            }

            Spacer()
        }
        .padding()
        .frame(width: width, height: height)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .stroke(style: StrokeStyle(lineWidth: 1, dash: isAddButton ? [5] : [])) // пунктир если isAddButton
                .foregroundColor(Color(UIColor.gray))
        )
    }
}

#Preview {
    Categories(category: Category(iconName: "cart", title: "food", amount: 4231), width: 300, height: 100)
}
