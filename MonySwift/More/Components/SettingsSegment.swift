//
//  SettingsSegment.swift
//  MonySwift
//
//  Created by Isa Melsov on 14/6/25.
//

import SwiftUI

struct OptionSegment: View {
    let iconName: String
    let text: String

    var body: some View {
        HStack {
            Image(systemName: iconName)
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
                .foregroundStyle(.white)

            Text(text)
                .font(.system(size: 18, weight: .medium))
                .foregroundStyle(.white)
                .padding(.horizontal)

            Spacer()
        }
        .padding()
    }
}


#Preview {
    OptionSegment(iconName: "gear", text: "settings")
        .background(Color.darkBlue)
}
