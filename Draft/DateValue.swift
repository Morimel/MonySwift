//
//  DateValue.swift
//  MonySwift
//
//  Created by Isa Melsov on 16/6/25.
//

import SwiftUI

struct DateValue: Identifiable {
    var id = UUID().uuidString
    var day: Int
    var date: Date
    var isPlaceholder: Bool = false
}
