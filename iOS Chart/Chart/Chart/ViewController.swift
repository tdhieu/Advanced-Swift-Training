//
//  ViewController.swift
//  Chart
//
//  Created by Tran Duc Hieu on 10/27/15.
//  Copyright © 2015 Tran Duc Hieu. All rights reserved.
//

/* Bai tap:

*/

import UIKit
import Charts

class ViewController: UIViewController {

    @IBOutlet weak var myBarChart: BarChartView!

    let arrTenCot = ["Jan", "Feb", "Mar","Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
    let arrGiaTri = [20.0, 13.3, 42.5, 16.7, 23.4, 55.3, 22.3, 25.7, 19.7, 23.8, 34.3, 15.8]
    
    func setChart(dataPoints dataPoints: [String], values: [Double]) {
        var dataEntries: [BarChartDataEntry] = []
        for i in 0..<values.count {
            dataEntries.append(BarChartDataEntry(value: values[i], xIndex: i))
        }
        let chartDataSet = BarChartDataSet(yVals: dataEntries, label: "Units Sold")
        let chartData = BarChartData(xVals: arrTenCot, dataSet: chartDataSet)
        myBarChart.data = chartData
        
        let arrColor:[UIColor] = [UIColor.redColor(), UIColor.blueColor(), UIColor.greenColor(),UIColor.redColor(), UIColor.blueColor(), UIColor.greenColor(),UIColor.redColor(), UIColor.blueColor(), UIColor.greenColor()]
        
        chartDataSet.colors = ChartColorTemplates.colorful()
        myBarChart.xAxis.labelPosition = .Bottom
        myBarChart.animate(xAxisDuration: 2, yAxisDuration: 2)
        myBarChart.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: ChartEasingOption.EaseInOutBounce)
        
        let limitLine = ChartLimitLine(limit: 21.0, label: "Gioi han san pham")
        myBarChart.rightAxis.addLimitLine(limitLine)
        myBarChart.descriptionText = ""
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setChart(dataPoints: arrTenCot, values: arrGiaTri)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

