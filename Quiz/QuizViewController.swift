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
    
    var basicIs: Bool = false
    var iphoneIs: Bool = false
    var algoIs: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var tmpArray = [AnyObject]()
        // 知識編: 6
        if basicIs {
            tmpArray.append(["プログラミング言語Pythonの名前の由来となったとされるGuido van Rossumの大好きな番組といえば？",
                "空飛ぶモンティ・パイソン","山登りモンティ・パイソン","宇宙に行くモンティ・パイソン",
                1])
            tmpArray.append(["プログラミング言語Rubyを開発した日本のエンジニアと言えば？",
                "まつもとゆきひろ","村上憲郎","橋本善久",
                1])
            tmpArray.append(["プログラミング言語C++を布教する活動からC++を使う人達についた俗称といえば？",
                "炎の軍団","闇の軍団","C.P.B.M.",
                2])
            tmpArray.append(["プログラミング言語SwiftがAppleのアプリケーション開発用言語として発表されたのは？",
                "WWDC2013","Apple Special Event2013","WWDC2014",
                3])
            tmpArray.append(["『すごいH本』で有名な純粋関数型言語といえば？",
                "Hadoop","Haskell","Lisp",
                2])
            tmpArray.append(["一説にコーヒーに関するものが名前の由来となっているとされているAndroidアプリ開発言語としても有名なプログラミング言語といえば？",
                "Fortran","Go","Java",
                3])
        }
        // iPhoneアプリ開発編: 6
        if iphoneIs {
            tmpArray.append(["iPhoneアプリ開発においてコードを書く際、UI要素の前にかならず書かなければいけないのは？",
                "@IBAction","@IBOutlet","@IBInspectable",
                2])
            tmpArray.append(["Swiftにおいて配列の大きさを取得するために書くのは？",
                ".count",".size",".length",
                1])
            tmpArray.append(["iPhoneアプリ開発において画面遷移のことをなんと言う？",
                "ChangeView","Segue","Move",
                2])
            tmpArray.append(["iPhoneアプリ開発において画面のデザインを行うファイルといえば？",
                "デザインボード","ファンタジーボード","ストーリーボード",
                3])
            tmpArray.append(["",
                "","","",
                ])
            tmpArray.append(["",
                "","","",
                ])
        }
        // アルゴリズム編: 6
        if algoIs {
            tmpArray.append(["",
                "","","",
                ])
            tmpArray.append(["",
                "","","",
                ])
            tmpArray.append(["",
                "","","",
                ])
            tmpArray.append(["",
                "","","",
                ])
            tmpArray.append(["",
                "","","",
                ])
            tmpArray.append(["",
                "","","",
                ])
        }
        
        while (tmpArray.count > 0) {
            // let index = Int(arc4random_uniform(UInt32(tmpArray.count)))
            let index = Int(rand()) % tmpArray.count
            quizArray.append(tmpArray[index])
            tmpArray.removeAtIndex(index)
        }
        choiceQuiz()
    }
    
    // 選択したクイズの問題文と選択肢の表示
    func choiceQuiz() {
        quizTextView.text = quizArray[0][0] as! String
        choiceButtons1.setTitle(quizArray[0][1] as? String, forState: .Normal)
        choiceButtons2.setTitle(quizArray[0][2] as? String, forState: .Normal)
        choiceButtons3.setTitle(quizArray[0][3] as? String, forState: .Normal)
    }

    // ユーザーの押した選択肢が正解かどうか
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
    
    // Resultviewへ
    func performSegueToResult() {
        performSegueWithIdentifier("toResultView", sender: nil)
    }
    
    // ResultViewにいくSegueが実行された時に正解数を渡す
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

