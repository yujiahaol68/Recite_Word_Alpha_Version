//
//  TViewController.swift
//  Recite_Word_Alpha_Version
//
//  Created by xiaobo on 15-2-13.
//  Copyright (c) 2015年 Sherlock.Yu. All rights reserved.
//

import UIKit
import CoreData

class TViewController: UIViewController,UITableViewDataSource {
    var ewords = [String]()
    var cwords = [String]()
    var Delaterow :Int!
    var Words = [Word]()
    
    @IBOutlet weak var img: UIImageView!

    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
        tableView.reloadData()
        self.tableView.backgroundView = self.img
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.fetchData()
    }
  
    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: true)
        tableView.setEditing(editing, animated: true)

    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete{
            ewords.removeAtIndex(indexPath.row)
            cwords.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Top)    //删除单词所在TV中的那一行，并且将数组中对应的中英文删除
            Delaterow = indexPath.row
            self.delateData(Delaterow)
            self.tableView.reloadData()
        }
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return ewords.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
   
   var  cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "cell")
        cell.textLabel?.font = UIFont.systemFontOfSize(16)
        cell.detailTextLabel?.textColor = UIColor(red:0.0 ,green:122.0/255.0, blue:1.0, alpha:1.0)
        cell.textLabel?.text = ewords[indexPath.row]
        cell.detailTextLabel?.text = cwords[indexPath.row]
        cell.backgroundColor = UIColor.clearColor()
        return cell
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetchData(){
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        let fetchRequest = NSFetchRequest(entityName: "Word")
        var error: NSError?
        
        let fetchedResults = managedContext.executeFetchRequest(fetchRequest, error: &error) as! [Word]?
        if let results = fetchedResults {
            Words = results
            for i in 0..<self.Words.count{
                cwords.append(self.Words[i].cexplaination)
                ewords.append(self.Words[i].orialE)
                
            }
        }else{
            println("获取失败 \(error), \(error!.userInfo)")
        }
        self.tableView.reloadData()
    }
    
    func delateData(row :Int){
      let wordToRemove = Words[row] as Word
      let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
      let managedContext = appDelegate.managedObjectContext!
      let fetchRequest = NSFetchRequest(entityName: "Word")
      managedContext.deleteObject(wordToRemove)
        var error: NSError?
        if !managedContext.save(&error) {
            println( "Could not save: \(error) " )
        }
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
