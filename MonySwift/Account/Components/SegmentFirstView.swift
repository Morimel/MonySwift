//
//  SegmentFirstView.swift
//  MonySwift
//
//  Created by Isa Melsov on 14/6/25.
//

import SwiftUI

struct SegmentFirst: View {
    var body: some View {
        AccountHeader(title: "Счета", titleColor: Color(UIColor.systemGray5), anountColor: .green, amount: 3481)
        
        AccountsViewCollection()
        
        AccountHeader(title: "Сбережения", titleColor: Color(UIColor.systemGray5), anountColor: .gray, amount: 0)
        
        SavingsView()
    }
}

#Preview {
    SegmentFirst()
}
