//
//  FirstViewController.swift
//  Lista de tareas
//
//  Created by Melo on 26/3/16.
//  Copyright © 2016 Melo. All rights reserved.
//

import UIKit

var toDoList = [String]()

class FirstViewController: UIViewController,UITextViewDelegate,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var toDoListTable: UITableView!
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        toDoListTable.reloadData()
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
    return toDoList.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = toDoList[indexPath.row]
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if(NSUserDefaults.standardUserDefaults().objectForKey("toDoList") != nil){
            toDoList = NSUserDefaults.standardUserDefaults().objectForKey("toDoList") as! [String]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        toDoList.removeAtIndex(indexPath.row)
        NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
        toDoListTable.reloadData()
        

        
    }
    
    

}

