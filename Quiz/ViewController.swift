//
//  ViewController.swift
//  Quiz
//
//  Created by 藤井陽介 on 2016/02/15.
//  Copyright © 2016年 com.litech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var basicSwitch: UISwitch!
    @IBOutlet weak var iphoneSwitch: UISwitch!
    @IBOutlet weak var algoSwitch: UISwitch!
    var basicIs: Bool = false
    var iphoneIs: Bool = false
    var algoIs: Bool = false
    
    let saveData: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Switchの状態に応じて問題を切り替える
    @IBAction func changeBasicSwitch(sender: UISwitch) {
        basicIs = basicSwitch.on
    }
    @IBAction func changeIphoneSwitch(sender: UISwitch) {
        iphoneIs = iphoneSwitch.on
    }
    @IBAction func changeAlgoSwitch(sender: UISwitch) {
        algoIs = algoSwitch.on
    }
    // どれか選択していないと遷移しないようにする
    @IBAction func pushStartButton(sender: UIButton) {
        if (basicIs||iphoneIs||algoIs) {
            performSegueWithIdentifier("toQuizView", sender: nil)
        } else {
            simpleAlert("いずれか一つは必ず選択してください。")
        }
    }
    // セグエで移る前に代入
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "toQuizView") {
            saveData.setObject(self.basicIs, forKey: "basic")
            saveData.setObject(self.iphoneIs, forKey: "iphone")
            saveData.setObject(self.algoIs, forKey: "algo")
        }
    }
    // 単純なアラートをつくる関数
    func simpleAlert(titleString: String) {
        let alertController = UIAlertController(title: titleString, message: nil, preferredStyle: .Alert)
        let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertController.addAction(defaultAction)
        presentViewController(alertController, animated: true, completion: nil)
    }
}
