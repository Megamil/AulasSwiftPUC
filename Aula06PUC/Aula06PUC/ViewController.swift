//
//  ViewController.swift
//  Aula06PUC
//
//  Created by Eduardo dos santos on 25/12/14.
//  Copyright (c) 2014 Eduardo dos santos. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var numeros = ["UM","DOIS","TRÊS","QUATRO","CINCO","SEIS","SETE","OITO","NOVE","DEZ","ONZE","DOIS... ZOEIRA"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)as CustomTableViewCell
        //cell.lblDesc.text = "COMENTÁRIO"
        cell.lblDesc.text = numeros[indexPath.row]
        cell.lblNum.text = String(indexPath.row + 1)
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return 10
        return numeros.count
    }


}

