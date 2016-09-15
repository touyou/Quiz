//
//  ResultViewController.swift
//  Quiz
//
//  Created by 藤井陽介 on 2016/02/01.
//  Copyright © 2016年 com.litech. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var correctAnswer:Int = 0
    @IBOutlet var resultLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        resultLabel.text = "正解数：" + String(correctAnswer) + "問"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backTitle() {
        self.dismiss(animated: true, completion: nil)
    }
}
