//
//  EmptyView.swift
//  MonySwift
//
//  Created by Isa Melsov on 14/6/25.
//

import SwiftUI

struct EmptyView: View {
    var body: some View {
        LottieView(animationName: "emptyLottie")
            .frame(height: 300)
            .background(Color.clear)
        
        Text("Пусто")
            .foregroundStyle(.white)
            .font(.title)
        
        Text("Начните добавлять расходы или доходы, и данные появятся")
            .multilineTextAlignment(.center)
            .font(.system(size: 16))
            .foregroundStyle(.white)
            .padding(.vertical, 4)
        
        Spacer()
    }
}

#Preview {
    EmptyView()
}
