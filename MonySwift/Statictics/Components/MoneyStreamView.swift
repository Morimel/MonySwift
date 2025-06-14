//
//  MoneyStreamView.swift
//  MonySwift
//
//  Created by Isa Melsov on 14/6/25.
//

import SwiftUI

struct MoneyStream: View {
    @Environment(\.horizontalSizeClass) var hSizeClass
    var body: some View {
        let height: CGFloat = hSizeClass == .regular ? 220 : 100
        
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.red, lineWidth: 1)
                .frame(width: .infinity, height: height)
                .padding(.horizontal)
            
            VStack {
                Text("Денежный поток")
                    .foregroundStyle(.white)
                    .font(.title3)
                
                Text("-\(16371) KGS")
                    .foregroundStyle(.red)
                    .font(.title2)
                    .padding(.top, 1)
            }
        }
    }
}

#Preview {
    MoneyStream()
}
