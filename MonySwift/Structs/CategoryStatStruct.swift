//
//  CategoryStruct.swift
//  MonySwift
//
//  Created by Isa Melsov on 14/6/25.
//

import SwiftUI

struct CategoryStat: Identifiable {
    let id = UUID()
    let icon: String      // SF Symbol или custom
    let iconColor: Color
    let bgColor: Color
    let name: String
    let amount: Int
    let percent: Double
}
