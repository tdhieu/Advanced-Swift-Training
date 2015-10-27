//
//  LineChartViewController.swift
//  Chart
//
//  Created by Tran Duc Hieu on 10/27/15.
//  Copyright © 2015 Tran Duc Hieu. All rights reserved.
//

import UIKit
import Charts

class LineChartViewController: UIViewController {
    
    @IBOutlet weak var myLineChart: LineChartView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        let unitsSold = [20.0, 13.3, 42.5, 16.7, 23.4, 55.3, 22.3, 25.7, 19.7, 23.8, 34.3, 15.8]
        
        setChart(dataPoints: months, values: unitsSold)
    }
    
    func setChart(dataPoints dataPoints: [String], values: [Double]) {
        var dataEntries: [ChartDataEntry] = []
        for i in 0..<values.count {
            let dataEntry = ChartDataEntry(value: values[i], xIndex: i)
            dataEntries.append(dataEntry)
        }
        let lineChartDataSet = LineChartDataSet(yVals: dataEntries, label: "Units Sold")
        let lineChartData = LineChartData(xVals: dataPoints, dataSet: lineChartDataSet)
        
        myLineChart.data = lineChartData
        
        var colors:[UIColor] = []
        for i in 0..<dataPoints.count {
            let red = Double(arc4random_uniform(256))
            let green = Double(arc4random_uniform(256))
            let blue = Double(arc4random_uniform(256))
            
            let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
            colors.append(color)
        }
        
        lineChartDataSet.colors = colors
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
