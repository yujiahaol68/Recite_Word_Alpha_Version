//
//  CustomWordListViewController.swift
//  Recite_Word_Alpha_Version
//
//  Created by Sherlock.Yu on 15-3-20.
//  Copyright (c) 2015年 Sherlock.Yu. All rights reserved.
//

import UIKit

class CustomWordListViewController: UIViewController {

    @IBOutlet weak var wordLisTextView: UITextView!
    var ch = [String]()
    var eng = [String]()
    var sch = [String]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        wordLisTextView.text = nil
        // Do any additional setup after loading the view.
    }
    
    @IBAction func creatWordList(sender: AnyObject) {
        wordLisTextView.text = nil
        var count = eng.count
        if count % 2 == 0{
            var a = count / 2
        for i in 0..<a {
                wordLisTextView.insertText("\(eng[2*i])-\(ch[2*i])    \(eng[2*i+1])-\(ch[2*i+1])\n")
            
            }
        }
        else{
            var b = (count + 1) / 2
            for i in 0..<b{
                wordLisTextView.insertText("\(eng[2*i])-\(ch[2*i])    \(eng[2*i+1])-\(ch[2*i+1])\n")
            }
            wordLisTextView.insertText("\(eng[b+1]) \(ch[b+1])\n")
            
        }
        //生成双列单词表
    }
    
    
    @IBAction func creatSingleWordList(sender: AnyObject) {
        wordLisTextView.text = nil
        var count = eng.count
        for i in 0..<count{
            wordLisTextView.insertText("\(eng[i]) - \(ch[i]) \n")
        }
        
    }
    
    @IBAction func sendMyWordList(sender: AnyObject) {
        sendEmail()
        
    }
    @IBAction func addInputWords(sender: AnyObject) {
        var alert = UIAlertController(title: "新单词", message: "请输入添加入单词表中的单词", preferredStyle: UIAlertControllerStyle.Alert)
        let addAction = UIAlertAction(title: "添加", style: UIAlertActionStyle.Default) { (action: UIAlertAction!) -> Void in
            let textField = alert.textFields![0] as! UITextField
            textField.clearButtonMode = UITextFieldViewMode.Always
            var content :String = textField.text
            self.loadData(content)
            
        }
        let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel, handler: nil)
        alert.addTextFieldWithConfigurationHandler { (textField: UITextField!) -> Void in
        }
        
        alert.addAction(addAction)
        alert.addAction(cancelAction)
        presentViewController(alert, animated: true, completion: nil)
        
    }
    
    func sendEmail(){
        UIApplication.sharedApplication().openURL(NSURL(string:"mailto:foo@example.com?cc=bar@example.com&subject=My%20Costom%20Teens%20Word%20List&body=\(wordLisTextView.text)")!)
        
        //系统发送邮件
    }
    
    
    func loadData(content:String){
        
        var url = ("http://fanyi.youdao.com/openapi.do?keyfrom=xxxxxdasdadadf&key=1357665114&type=data&doctype=json&version=1.1&q=\(content)")
        var derror: NSError?
        var request = NSURLRequest(URL: NSURL(string: url)!)
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response: NSURLResponse!, Data: NSData!, error:NSError!) -> Void in
            var JsonResult:AnyObject! = NSJSONSerialization.JSONObjectWithData(Data, options: NSJSONReadingOptions.AllowFragments, error: &derror)
            var translation :AnyObject = JsonResult.objectForKey("translation")!
            if  let explains :AnyObject = JsonResult.objectForKey("basic"){
                var word :String = translation[0] as! String
                var wordexplains :AnyObject = explains.objectForKey("explains")!
                var ManyExplains :String = wordexplains[0] as! String
                self.sch = ManyExplains.componentsSeparatedByString("；")
                self.ch.append(self.sch[0])
                self.eng.append(content)
                println(self.sch[0])
                self.succeedGetWord(ManyExplains)
            }
            else {
                self.Failtogetword()
            }
                                                      //json交换获取单词释义
        }
        
    }

    
    func Failtogetword(){
        let warnAlert = UIAlertController(title: "警告", message: "亲，不要调皮哟？！", preferredStyle: UIAlertControllerStyle.Alert)
        let action = UIAlertAction(title: "T_T下次不会再犯了", style: UIAlertActionStyle.Default, handler: nil)
        warnAlert.addAction(action)
        presentViewController(warnAlert, animated: true, completion: nil)
    }
    
    func succeedGetWord(Cword :String){
        var alert = UIAlertController(title: "添加成功", message: "\(Cword)", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addTextFieldWithConfigurationHandler { (textField: UITextField!) -> Void in
        }
        let action = UIAlertAction(title: "继续添加", style:UIAlertActionStyle.Default, handler: { (action: UIAlertAction!) -> Void in
            let textField = alert.textFields![0] as! UITextField
            var content :String = textField.text
            self.loadData(content)
        })
        let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.Default, handler: nil)
        alert.addAction(action)
        alert.addAction(cancelAction)
        presentViewController(alert, animated: true, completion: nil)
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
