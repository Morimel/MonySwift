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
    //    let action: () -> Void
    
    var body: some View {
        Button(action: {
            //            action()
        }) {
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
            .cornerRadius(12)
        }
    }
}

#Preview {
    OptionSegment(iconName: "gear", text: "settings")
}
