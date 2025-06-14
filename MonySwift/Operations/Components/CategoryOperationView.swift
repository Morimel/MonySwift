//
//  CategoryOperationView.swift
//  MonySwift
//
//  Created by Isa Melsov on 14/6/25.
//

import SwiftUI

struct CategoryOperation: View {
    var body: some View {
        HStack {
            Image(systemName: "cart")
                .foregroundStyle(.white)
                .padding()
            VStack(alignment: .leading) {
                Text("Продукты")
                    .foregroundStyle(.white)
                HStack {
                    Image(systemName: "wallet.bifold")
                    Text("Карта")
                }
                .foregroundStyle(.white)
                
            }
            Spacer()
            
            Text("\(9) KGS")
                .foregroundStyle(.red)
            
        }
        .padding(.horizontal)
    }
}

#Preview {
    CategoryOperation()
}
