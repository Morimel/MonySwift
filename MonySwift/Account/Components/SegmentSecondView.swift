//
//  SegmentSecond.swift
//  MonySwift
//
//  Created by Isa Melsov on 14/6/25.
//

import SwiftUI

struct SegmentSecond: View {
    var body: some View {
        VStack {
            Text("Нажмите на значение, чтобы поменять валюту")
                .foregroundStyle(.white)
                .font(.callout)
                .padding(.top)
            
            OverallElements(text: "Всего", strokeColor: .green, downColor: .green, textColor: .green, strokeOpacity: 1)
            
            OverallElements(text: "Счета", strokeColor: .gray, downColor: .green, textColor: .green, strokeOpacity: 0.3)
            
            OverallElements(text: "Сбережения", strokeColor: .gray, downColor: .clear, textColor: .white, strokeOpacity: 0.3)
            
            OverallElements(text: "Долги", strokeColor: .gray, downColor: .clear, textColor: .white, strokeOpacity: 0.3)
        }
    }
}


#Preview {
    SegmentSecond()
}
