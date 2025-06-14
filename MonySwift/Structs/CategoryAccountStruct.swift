//
//  Untitled.swift
//  MonySwift
//
//  Created by Isa Melsov on 14/6/25.
//

import SwiftUI

struct CategoryAccount: Identifiable {
    let id = UUID()
    let iconName: String
    let title: String
    let amount: Double
}
