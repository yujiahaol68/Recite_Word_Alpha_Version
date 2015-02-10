//
//  ViewController.swift
//  Recite_Word_Alpha_Version
//
//  Created by Sherlock.Yu on 15-2-6.
//  Copyright (c) 2015年 Sherlock.Yu. All rights reserved.
//

import UIKit

protocol ParamsProtocol{
    func returnParams(EnStr :String,ChStr :String)
}
    
class ViewController: UIViewController {

    var chineseWords :String!
    var englishWords :String!
    var nw :EnglishWord!
    var paramsProtocolDelegate: ParamsProtocol?
    
    @IBAction func addWords(sender: AnyObject) {
        var alert = UIAlertController(title: "新单词", message: "请输入添加入单词本的单词", preferredStyle: UIAlertControllerStyle.Alert)
        let saveAction = UIAlertAction(title: "保存", style: UIAlertActionStyle.Default) { (action: UIAlertAction!) -> Void in
            
        let textField = alert.textFields![0] as UITextField
        self.englishWords = textField.text
            var content:String = textField.text
           self.loadData(content)
            
            println("用户添加了")
            println(self.englishWords)
            self.performSegueWithIdentifier("TVC", sender: self)
        }
        
        let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel, handler: nil)
        alert.addTextFieldWithConfigurationHandler { (textField: UITextField!) -> Void in
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        presentViewController(alert, animated: true, completion: nil)
        
    }
    
    func start(){
        self.paramsProtocolDelegate?.returnParams(englishWords, ChStr: chineseWords)
       
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    func loadData(content:String){
        
            var url = ("http://fanyi.youdao.com/openapi.do?keyfrom=xxxxxdasdadadf&key=1357665114&type=data&doctype=json&version=1.1&q=\(content)")
        
            var request = NSURLRequest(URL: NSURL(string: url)!)
            NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response: NSURLResponse!, Data: NSData!, error:NSError!) -> Void in
                var JsonResult:AnyObject! = NSJSONSerialization.JSONObjectWithData(Data, options: NSJSONReadingOptions.MutableContainers, error: nil)
                var translation :AnyObject = JsonResult.objectForKey("translation")!
                var explains :AnyObject = JsonResult.objectForKey("basic")!
                var word :String = translation[0] as String
                var wordexplains :AnyObject = explains.objectForKey("explains")!
                var ManyExplains :String = wordexplains[0] as String
                self.chineseWords = ManyExplains
                self.nw.ChineseEP = self.chineseWords
                println(self.chineseWords)
        }
        
    }

}

