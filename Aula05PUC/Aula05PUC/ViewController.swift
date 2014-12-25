//
//  ViewController.swift
//  Aula05PUC
//
//  Created by Eduardo dos santos on 24/12/14.
//  Copyright (c) 2014 Eduardo dos santos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pieChartView: CustomView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func completarAction(sender: AnyObject) {
        pieChartView.piePercentage = 100
    }


}

