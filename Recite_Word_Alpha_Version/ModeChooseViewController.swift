//
//  ModeChooseViewController.swift
//  Recite_Word_Alpha_Version
//
//  Created by xiaobo on 15-2-27.
//  Copyright (c) 2015年 Sherlock.Yu. All rights reserved.
//

import UIKit
import CoreData

class ModeChooseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var count = self.wordCountCheck()
        if count <= 10{
        self.navigationController?.popToRootViewControllerAnimated(true)
        self.warnToReturn()
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func wordCountCheck() -> Int{                  //单词个数检查
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        let fetchRequest = NSFetchRequest(entityName: "Word")   //获取查询结果
        let fetchedResults = managedContext.executeFetchRequest(fetchRequest, error: nil) as! [Word]?
        let wordCount = fetchedResults?.count
        return wordCount!
    }
    
    func warnToReturn(){
        let alert = UIAlertController(title: "警告", message: "添加入单词本的单词必须大于10个", preferredStyle: UIAlertControllerStyle.Alert)
        let action = UIAlertAction(title: "好的", style: UIAlertActionStyle.Default, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
        
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
