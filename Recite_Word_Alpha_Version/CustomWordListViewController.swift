//
//  CustomWordListViewController.swift
//  Recite_Word_Alpha_Version
//
//  Created by xiaobo on 15-3-20.
//  Copyright (c) 2015年 Sherlock.Yu. All rights reserved.
//

import UIKit

class CustomWordListViewController: UIViewController {

    @IBOutlet weak var wordLisTextView: UITextView!
    var ch = [String]()
    var eng = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func creatWordList(sender: AnyObject) {
        
        
        //生成单词表
    }
    func addNewWord(){
        
        
        //添加新单词
    }
    
    func getWordData(){
        
        //json交换获取单词释义
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
