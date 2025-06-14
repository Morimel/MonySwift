//
//  TopAreaView.swift
//  MonySwift
//
//  Created by Isa Melsov on 14/6/25.
//

import SwiftUI

struct TopArea: View {
    var body: some View {
        VStack {
            Text("Общий баланс")
                .foregroundStyle(.white)
            Text("\(3481) KGS")
                .font(.system(size: 32, weight: .bold, design: .default))
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    TopArea()
}
