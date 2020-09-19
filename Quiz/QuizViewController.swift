//
//  ViewController.swift
//  Quiz
//
//  Created by 藤井陽介 on 2016/01/31.
//  Copyright © 2016年 com.litech. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    var quizArray = [[Any]]()
    var correctAnswer:Int = 0
    @IBOutlet var quizTextView: UITextView!
    @IBOutlet var choiceButtons1: UIButton!
    @IBOutlet var choiceButtons2: UIButton!
    @IBOutlet var choiceButtons3: UIButton!
    
    var basicIs: Bool = false
    var iphoneIs: Bool = false
    var algoIs: Bool = false

    let saveData: UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if saveData.object(forKey: "basic") != nil {
            basicIs = saveData.object(forKey: "basic") as! Bool
        }
        if saveData.object(forKey: "iphone") != nil {
            iphoneIs = saveData.object(forKey: "iphone") as! Bool
        }
        if saveData.object(forKey: "algo") != nil {
            algoIs = saveData.object(forKey: "algo") as! Bool
        }
        
        var tmpArray = [[Any]]()
        // 知識編: 10
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
            tmpArray.append(["Appleの創業者のうちSteve Jobsじゃない方は？",
                "スティーブ・ウォズニアック","スティーブ・ジョンソン","スティーブ・ポッター",
                1])
            tmpArray.append(["日本語で書けるプログラミング言語として実在するものは？",
                "あさがお","なでしこ","くのいち",
                2])
            tmpArray.append(["Unity独自の言語であるBooのもととなっているプログラミング言語は？",
                "Lisp","Ruby","Python",
                3])
            tmpArray.append(["Go言語はどこの会社の言語？",
                "Microsoft","Google","Adobe",
                2])
        }
        // iPhoneアプリ開発編: 10
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
            tmpArray.append(["起動した時にうつすViewをまるごと起動時の状態によって切り替えたい場合、どのファイルにその条件分岐を記述すればよい？",
                "ViewController.swift","AppDelegate.swift","LanchScreen.storyboard",
                2])
            tmpArray.append(["SNS投稿機能を使いたい時にimportしなければならないライブラリと言えば？",
                "Social","UIKit","Fabric",
                1])
            tmpArray.append(["iPhoneアプリ開発の統合開発環境といえば？",
                "Xcode","Atom","Visual Studio",
                1])
            tmpArray.append(["Labelのコード上での型名は？",
                "UITextLabel","UILabel","UILavelView",
                2])
            tmpArray.append(["CollectionViewのコード上での型名は？",
                "UICollectionViewController","UICollectionViewDelegate","UICollectionView",
                3])
            tmpArray.append(["iPhoneアプリ開発においてコードを書く時、ボタンをおした時の処理などを記述する関数に必ずつけるものといえば？",
                "@IBAction","@IBInspectable","@IBDesignable",
                1])
        }
        // アルゴリズム編: 7
        if algoIs {
            tmpArray.append(["再帰関数を用いて木の根をたどるように探索するアルゴリズムといえば？",
                "深さ優先探索","幅優先探索","木の根探索",
                1])
            tmpArray.append(["最短経路を求めるアルゴリズムとして有名なもののうち、スタートから順に最短距離を確定させていくことでおこなうものは？",
                "ベルマンフォード法","プリム法","ダイクストラ法",
                3])
            tmpArray.append(["漸化式をたてることで計算量を大幅に減らすことが出来るアルゴリズムの動的計画法、これの略称として一般的なものは？",
                "DK","DP","MP",
                2])
            tmpArray.append(["プログラミングコンテストの攻略本として発行され、以降アルゴリズムの解説書として一般のプログラマにも人気となった秋葉拓哉、岩田陽一、北川宜稔著『プログラミングコンテストチャレンジブック』の俗称と言えば？",
                "蟻本","雲丹本","猫本",
                1])
            tmpArray.append(["bitDPというアルゴリズムを使う問題をその代表的なものの名前をとってなんという？",
                "巡回サービスマン問題","巡回セールスマン問題","巡回郵便局問題",
                2])
            tmpArray.append(["かつては日本に競技プログラミングを広める広告塔となり、日本初のプログラミングコンテスト運営会社であるAtCoder社を設立した人といえば？",
                "高橋直大","高橋正三","高橋利幸",
                1])
            tmpArray.append(["囲碁などのAIにつかわれる乱数を利用したアルゴリズムといえば？",
                "モンテカルロ法","カルテモンロ法","メルセンヌ法",
                1])
        }
        
        quizArray = tmpArray.shuffled()
        choiceQuiz()
    }
    
    // 選択したクイズの問題文と選択肢の表示
    func choiceQuiz() {
        quizTextView.text = quizArray[0][0] as? String
        choiceButtons1.setTitle(quizArray[0][1] as? String, for: .normal)
        choiceButtons2.setTitle(quizArray[0][2] as? String, for: .normal)
        choiceButtons3.setTitle(quizArray[0][3] as? String, for: .normal)
    }

    // ユーザーの押した選択肢が正解かどうか
    @IBAction func choiceAnswer(_ sender: UIButton) {
        if quizArray[0][4] as! Int == sender.tag {
            correctAnswer += 1
        }
        quizArray.remove(at: 0)
        if quizArray.count == 0 {
            performSegueToResult()
        } else {
            choiceQuiz()
        }
    }
    
    // Resultviewへ
    func performSegueToResult() {
        performSegue(withIdentifier: "toResultView", sender: nil)
    }
    
    // ResultViewにいくSegueが実行された時に正解数を渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toResultView") {
            let resultView = segue.destination as! ResultViewController
            resultView.correctAnswer = self.correctAnswer
        }
    }
}

