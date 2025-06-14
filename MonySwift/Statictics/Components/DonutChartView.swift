//
//  DonutChartView.swift
//  MonySwift
//
//  Created by Isa Melsov on 14/6/25.
//

import SwiftUI

struct DonutSegment: View {
    let startAngle: Double
    let endAngle: Double
    let color: Color
    let lineWidth: CGFloat

    var body: some View {
        Circle()
            .trim(from: startAngle, to: endAngle)
            .stroke(color, style: StrokeStyle(lineWidth: lineWidth, lineCap: .butt))
            .rotationEffect(.degrees(-90))
    }
}


struct DynamicDonutChart: View {
    
    @Environment(\.horizontalSizeClass) var hSizeClass

    let segments: [DonutSegmentData]
    let lineWidth: CGFloat
    let gap: Double = 0.002

    struct CalculatedSegment: Identifiable {
        let id = UUID()
        let start: Double
        let end: Double
        let color: Color
    }

    var calculatedSegments: [CalculatedSegment] {
        let total = segments.map(\.value).reduce(0, +)
        var currentStart: Double = 0

        return segments.map { segment in
            let percent = segment.value / total
            let start = currentStart
            let end = start + percent - gap
            currentStart += percent
            return CalculatedSegment(start: start, end: end, color: segment.color)
        }
    }

    var body: some View {
        let size: CGFloat = hSizeClass == .regular ? 320 : 288
        let chartSize = size

        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                .frame(width: .infinity, height: chartSize + 70) // чуть больше круга

            ForEach(calculatedSegments) { seg in
                DonutSegment(
                    startAngle: seg.start,
                    endAngle: seg.end,
                    color: seg.color,
                    lineWidth: lineWidth
                )
                .frame(width: .infinity, height: chartSize)
            }

            // Центр
            VStack(spacing: 8) {
                Image(systemName: "dollarsign")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.gray)
                    .padding(8)
                    .background(Color(.darkGray))
                    .clipShape(RoundedRectangle(cornerRadius: 8))

                Text("Не выбрано")
                    .foregroundColor(.gray)
                    .font(.system(size: 16))
            }
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    DynamicDonutChart(segments: [DonutSegmentData(color: .red, value: 100)], lineWidth: 35)
}
