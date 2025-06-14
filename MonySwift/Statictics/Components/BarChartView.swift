//
//  BarChartView.swift
//  MonySwift
//
//  Created by Isa Melsov on 14/6/25.
//

import SwiftUI
import DGCharts

class CustomYAxisFormatter: NSObject, AxisValueFormatter {
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        return value == 0 ? "" : "\(Int(value / 1000))k"
    }
}

class CustomXAxisFormatter: NSObject, AxisValueFormatter {
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        let intValue = Int(value)
        let visible = [5, 10, 15, 20, 25, 30]
        return visible.contains(intValue) ? "\(intValue)" : ""
    }
}


struct BarChartUIKit: UIViewRepresentable {
    let values: [Double]
    
    func makeUIView(context: Context) -> BarChartView {
        let chart = BarChartView()
        
        // Генерация данных
        let entries = values.enumerated().map { index, value in
            BarChartDataEntry(x: Double(index + 1), y: value)
        }
        
        let dataSet = BarChartDataSet(entries: entries, label: "")
        dataSet.colors = [NSUIColor.systemRed] // Используем NSUIColor (вместо UIColor)
        dataSet.drawValuesEnabled = false
        dataSet.barShadowColor = NSUIColor.clear
        dataSet.highlightColor = NSUIColor.clear
        dataSet.barBorderWidth = 0
        
        let data = BarChartData(dataSet: dataSet)
        data.barWidth = 0.6
        
        chart.data = data
        
        // Настройки осей
        chart.leftAxis.valueFormatter = CustomYAxisFormatter()
        chart.leftAxis.setLabelCount(5, force: true)
        chart.leftAxis.axisMinimum = 0
        chart.leftAxis.axisMaximum = 200_000
        chart.leftAxis.labelTextColor = NSUIColor.lightGray
        chart.leftAxis.gridLineDashLengths = [4, 4]
        chart.leftAxis.gridColor = NSUIColor.white.withAlphaComponent(0.4)
        chart.leftAxis.labelFont = NSUIFont.systemFont(ofSize: 12)
        chart.leftAxis.drawAxisLineEnabled = false
        chart.leftAxis.granularity = 50_000
        
        chart.rightAxis.enabled = false
        
        chart.xAxis.valueFormatter = CustomXAxisFormatter()
        chart.xAxis.setLabelCount(7, force: true)
        chart.xAxis.labelPosition = .bottom
        chart.xAxis.labelTextColor = NSUIColor.lightGray
        chart.xAxis.drawGridLinesEnabled = true
        chart.xAxis.gridLineDashLengths = [4, 4]
        chart.xAxis.gridColor = NSUIColor.white.withAlphaComponent(0.4)
        chart.xAxis.labelFont = NSUIFont.systemFont(ofSize: 12)
        chart.xAxis.axisMinimum = 6
        chart.xAxis.axisMaximum = 30
        chart.xAxis.granularity = 5
        chart.xAxis.setLabelCount(6, force: true)
        
        chart.legend.enabled = false
        chart.backgroundColor = NSUIColor.black
        chart.drawBordersEnabled = false
        chart.animate(yAxisDuration: 1.0, easingOption: .easeOutBack)
        
        chart.setExtraOffsets(left: 10, top: 10, right: 20, bottom: 10)
        chart.fitBars = true
        chart.backgroundColor = .clear
        
        return chart
    }
    
    func updateUIView(_ uiView: BarChartView, context: Context) {}
}

#Preview {
    BarChartView()
}
