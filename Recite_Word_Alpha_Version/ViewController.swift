//
//  ViewController.swift
//  Recite_Word_Alpha_Version
//
//  Created by Sherlock.Yu on 15-2-6.
//  Copyright (c) 2015年 Sherlock.Yu. All rights reserved.
//

import UIKit
import CoreData
    
class ViewController: UIViewController {

    var Word = [NSManagedObject]()
    var chineseWords :String!
    var englishWords :String!
    var orialE = [String]()
    var cexplaination = [String]()
    
    @IBAction func addWords(sender: AnyObject) {
        var warning = UIAlertController(title: "警告", message: "输入单词不能为空", preferredStyle: UIAlertControllerStyle.Alert)
        var alert = UIAlertController(title: "新单词", message: "请输入添加入单词本的单词", preferredStyle: UIAlertControllerStyle.Alert)
        let saveAction = UIAlertAction(title: "保存", style: UIAlertActionStyle.Default) { (action: UIAlertAction!) -> Void in
        let textField = alert.textFields![0] as UITextField
        textField.clearButtonMode = UITextFieldViewMode.Always
        self.englishWords = textField.text
        var content:String = textField.text
        self.loadData(content)

            println("用户添加了")
            println(self.englishWords)
        }
        
        let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel, handler: nil)
        alert.addTextFieldWithConfigurationHandler { (textField: UITextField!) -> Void in
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        presentViewController(alert, animated: true, completion: nil)
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func saveWord(){
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        
        let managedContext = appDelegate.managedObjectContext!
        
        let entity = NSEntityDescription.entityForName("Word", inManagedObjectContext: managedContext)
        
        let oneWord = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
        var righttime = 0
        var wrongtime = 0
        
        oneWord.setValue(self.englishWords, forKey: "orialE")
        oneWord.setValue(self.chineseWords, forKey: "cexplaination")
        oneWord.setValue(righttime, forKey: "righttimes")
        oneWord.setValue(wrongtime, forKey: "wrongtimes")
        oneWord.setValue(false, forKey: "checked")
        
        var error: NSError?
        if !managedContext.save(&error){
            println("保存失败 \(error), \(error?.userInfo)")
        }
        
        Word.append(oneWord)
        
    }

    
    func loadData(content:String){
        
            var url = ("http://fanyi.youdao.com/openapi.do?keyfrom=xxxxxdasdadadf&key=1357665114&type=data&doctype=json&version=1.1&q=\(content)")
            var derror: NSError?
            var request = NSURLRequest(URL: NSURL(string: url)!)
            NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response: NSURLResponse!, Data: NSData!, error:NSError!) -> Void in
                var JsonResult:AnyObject! = NSJSONSerialization.JSONObjectWithData(Data, options: NSJSONReadingOptions.AllowFragments, error: &derror)
                var translation :AnyObject = JsonResult.objectForKey("translation")!
                if  let explains :AnyObject = JsonResult.objectForKey("basic"){
                    var word :String = translation[0] as String
                    var wordexplains :AnyObject = explains.objectForKey("explains")!
                    var ManyExplains :String = wordexplains[0] as String
                    self.chineseWords = ManyExplains
                    self.cexplaination.append(self.chineseWords)
                    self.orialE.append(self.englishWords)
                    self.saveWord()
                    println(self.chineseWords)
                }
                else {
                    self.Failtogetword()
                }
                
        }
        
    }

    func Failtogetword(){
        let warnAlert = UIAlertController(title: "警告", message: "亲，不要调皮哟？！", preferredStyle: UIAlertControllerStyle.Alert)
        let action = UIAlertAction(title: "下次不会再犯了", style: UIAlertActionStyle.Default, handler: nil)
        warnAlert.addAction(action)
        presentViewController(warnAlert, animated: true, completion: nil)
    }
    
    
    
}

