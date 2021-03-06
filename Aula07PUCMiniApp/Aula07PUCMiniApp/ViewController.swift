//
//  ViewController.swift
//  Aula07PUCMiniApp
//
//  Created by Eduardo dos santos on 25/12/14.
//  Copyright (c) 2014 Eduardo dos santos. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var imagesArray: [(name: String,image: String)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagesArray = [(" WATCH","img1"),(" iOS 8","img2"),(" PAY","img3")]
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var tableViewcell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        
        tableViewcell.textLabel?.text = imagesArray[indexPath.row].name
        
        return tableViewcell;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imagesArray.count
    }
    
    //É executado antes da Storyboard e já prepara a proxima view controller com os objetos e variáveis necessárias.
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var dtVC = segue.destinationViewController as DetailViewController
        
        let idxPath = tableView.indexPathForCell(sender as UITableViewCell) as NSIndexPath?
        
        dtVC.imgSelected = imagesArray[idxPath!.row].image
    }

}

