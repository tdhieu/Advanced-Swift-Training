//
//  ViewController.swift
//  Chart
//
//  Created by Tran Duc Hieu on 10/27/15.
//  Copyright © 2015 Tran Duc Hieu. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController {

    @IBOutlet weak var myBarChart: BarChartView!

    let arrTenCot = ["Jan", "Feb", "Mar","Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
    let arrGiaTri = [20.0, 13.3, 42.5, 16.7, 23.4, 5.3, 12.3, 25.7, 19.7, 23.8, 34.3, 15.8]
    
    func setChart(dataPoints dataPoints: [String], values: [Double]) {
        var dataEntries: [BarChartDataEntry] = []
        for i in 0..<values.count {
            dataEntries.append(BarChartDataEntry(value: values[i], xIndex: i))
        }
        let chartDataSet = BarChartDataSet(yVals: dataEntries, label: "Units Sold")
        let chartData = BarChartData(xVals: arrTenCot, dataSet: chartDataSet)
        myBarChart.data = chartData
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

