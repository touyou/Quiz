//
//  ViewController.swift
//  Quiz
//
//  Created by 藤井陽介 on 2016/02/15.
//  Copyright © 2016年 com.litech. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ViewController: UIViewController {

    @IBOutlet weak var basicSwitch: UISwitch!
    @IBOutlet weak var iphoneSwitch: UISwitch!
    @IBOutlet weak var algoSwitch: UISwitch!
    // Google Ads関連
    @IBOutlet var bannerView: GADBannerView!
    
    var basicIs: Bool = false
    var iphoneIs: Bool = false
    var algoIs: Bool = false
    
    let saveData: UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Google Ads関連
        self.bannerView.adSize = kGADAdSizeSmartBannerPortrait
        // for test
        // self.bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        // for sale
        self.bannerView.adUnitID = "ca-app-pub-2853999389157478/2042602869"
        self.bannerView.rootViewController = self
        self.bannerView.load(GADRequest())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Switchの状態に応じて問題を切り替える
    @IBAction func changeBasicSwitch(_ sender: UISwitch) {
        basicIs = basicSwitch.isOn
    }
    @IBAction func changeIphoneSwitch(_ sender: UISwitch) {
        iphoneIs = iphoneSwitch.isOn
    }
    @IBAction func changeAlgoSwitch(_ sender: UISwitch) {
        algoIs = algoSwitch.isOn
    }
    // どれか選択していないと遷移しないようにする
    @IBAction func pushStartButton(_ sender: UIButton) {
        if (basicIs||iphoneIs||algoIs) {
            performSegue(withIdentifier: "toQuizView", sender: nil)
        } else {
            simpleAlert("いずれか一つは必ず選択してください。")
        }
    }
    // セグエで移る前に代入
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toQuizView") {
            saveData.set(self.basicIs, forKey: "basic")
            saveData.set(self.iphoneIs, forKey: "iphone")
            saveData.set(self.algoIs, forKey: "algo")
        }
    }
    // 単純なアラートをつくる関数
    func simpleAlert(_ titleString: String) {
        let alertController = UIAlertController(title: titleString, message: nil, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
    }
}
