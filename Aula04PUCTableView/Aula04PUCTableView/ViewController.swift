//
//  ViewController.swift
//  Aula04PUCTableView
//
//  Created by Eduardo dos santos on 24/12/14.
//  Copyright (c) 2014 Eduardo dos santos. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

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
        cell.lblNum.text = "Numeração"
        cell.lblDesc.text = "Conteúdo"
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
    }


}

