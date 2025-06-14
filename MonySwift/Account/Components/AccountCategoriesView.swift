//
//  AccountCategoriesView.swift
//  MonySwift
//
//  Created by Isa Melsov on 14/6/25.
//

import SwiftUI

struct CategoriesAccount: View {
    let category: Category
    let width: CGFloat
    let height: CGFloat
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
                        .font(.subheadline)
                        .foregroundColor(.gray)
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
    CategoriesAccount(category: Category(iconName: "cart", title: "food", amount: 1245), width: 200, height: 100)
}
