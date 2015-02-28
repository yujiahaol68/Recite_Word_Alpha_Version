//
//  SpellCheckViewController.swift
//  Recite_Word_Alpha_Version
//
//  Created by xiaobo on 15-2-27.
//  Copyright (c) 2015年 Sherlock.Yu. All rights reserved.
//

import UIKit

class SpellCheckViewController: UIViewController {

    @IBOutlet weak var wordTextDispaly: UITextView!
    @IBOutlet weak var characterRemain: UITextView!
    @IBOutlet weak var rightWrongImg: UIImageView!
    
    @IBOutlet weak var userTextField: UITextField!
    
    @IBAction func submitUserWord(sender: AnyObject) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
