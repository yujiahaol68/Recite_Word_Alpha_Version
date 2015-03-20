//
//  SpellCheckViewController.swift
//  Recite_Word_Alpha_Version
//
//  Created by xiaobo on 15-2-27.
//  Copyright (c) 2015年 Sherlock.Yu. All rights reserved.
//

import UIKit
import CoreData

class SpellCheckViewController: UIViewController {
    
    var wordText: Dictionary<String, String>!        //存储获取到的单词的中英文

    @IBOutlet weak var wordTextDispaly: UITextView!  //中文显示
    @IBOutlet weak var characterRemain: UITextView!  //剩余单词字母个数
    @IBOutlet weak var rightWrongImg: UIImageView!   //对错图
    
    @IBOutlet weak var userTextField: UITextField!
    
    @IBAction func submitUserWord(sender: AnyObject) {
        
        
        //用户提交单词时判断对错，改变img的对错图片并播放对应对错音频，提交过后不允许再次按下按钮，直到NSTimer倒计时完成，进入到下一个单词的考察，才可以恢复按钮的enable状态
    }
    
    @IBAction func implyAudio(sender: AnyObject) {
        
        
        
        //播放单词读音
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetchWordData(){
        
        
        
        //获取单词并形成字典型数据
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
