//
//  DividerView.swift
//  MonySwift
//
//  Created by Isa Melsov on 14/6/25.
//

import SwiftUI

struct DividerCustom: View {
    var body: some View {
        Divider()
            .frame(height: 1)
            .background(Color.gray)
            .padding(.vertical)
    }
}

#Preview {
    DividerCustom()
}
