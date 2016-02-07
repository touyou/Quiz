//
//  ViewController.swift
//  Quiz
//
//  Created by 藤井陽介 on 2016/01/31.
//  Copyright © 2016年 com.litech. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    var quizArray = [AnyObject]()
    var correctAnswer:Int = 0
    @IBOutlet var quizTextView: UITextView!
    @IBOutlet var choiceButtons1: UIButton!
    @IBOutlet var choiceButtons2: UIButton!
    @IBOutlet var choiceButtons3: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var tmpArray = [AnyObject]()
        tmpArray.append(["flumpoolのギターは？","阪井一生","山村隆太","志村けん",1])
        tmpArray.append(["お笑い界の重鎮といえば？","明石家さんま","野々村竜太郎","川谷絵音",1])
        tmpArray.append(["SPECにも出演し朝ドラをきっかけにブレイクした女優といえば？","樹木希林","有村架純","澤穂希",2])
        tmpArray.append(["今何問目？","0問目","10問目","わからない",3])
        tmpArray.append(["さっきみたいな問題が出てくるのは？","東大入試","クイズ・タイムショック","ミリオネア",2])
        tmpArray.append(["君にもアプリは？","作れる","作れない","そんなことよりお茶飲も？",1])
        
        while (tmpArray.count > 0) {
            // let index = Int(arc4random_uniform(UInt32(tmpArray.count)))
            let index = Int(rand()) % tmpArray.count
            quizArray.append(tmpArray[index])
            tmpArray.removeAtIndex(index)
        }
        choiceQuiz()
    }
    
    func choiceQuiz() {
        quizTextView.text = quizArray[0][0] as! String
        choiceButtons1.setTitle(quizArray[0][1] as? String, forState: .Normal)
        choiceButtons2.setTitle(quizArray[0][2] as? String, forState: .Normal)
        choiceButtons3.setTitle(quizArray[0][3] as? String, forState: .Normal)
    }
    
    @IBAction func choiceAnswer(sender: UIButton) {
        if quizArray[0][4] as! Int == sender.tag {
            correctAnswer++
        }
        quizArray.removeAtIndex(0)
        if quizArray.count == 0 {
            performSegueToResult()
        } else {
            choiceQuiz()
        }
    }
    
    func performSegueToResult() {
        performSegueWithIdentifier("toResultView", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "toResultView") {
            let resultView = segue.destinationViewController as! ResultViewController
            resultView.correctAnswer = self.correctAnswer
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

