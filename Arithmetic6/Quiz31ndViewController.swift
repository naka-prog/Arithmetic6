//
//  Quiz31ndViewController.swift
//  Arithmetic6
//
//  Created by koji nakashima on 2021/02/01.
//

import UIKit

class Quiz31ndViewController: UIViewController {
    var selection:[String] = []         // Grade1ndViewからの引き渡し
    var calculationIndex = ""
    
    var totalNumber = 10                    // 問題数
    var correctNumber = 0                   // 正解数
    var questionNumber = 0                  // 問題の番号
    var totalTime:Int = 0                   // 全問時間計測
    var questionstartTime:Date = Date()     // 処理時間計測
    var answerNumber = ""                   // 正解の答え
    var judgment = ""                       // 正・誤判断
    var randomX = 0                         // ランダム変数
    var leftNumberX = 0                     // ランダム変数(計算用)

    var result:[String] = []                // resultへの引き渡し
    var resultLine = ""                     // resultへの引き渡し

    var fourRules = ""                      // 四則計算

    let sp = " "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Viewからの引き渡し
        print("Grade → \(selection[0]):\(selection[1])")
        titleLabel.text = selection[0]
        switch selection[0] {
            case "たし算":
                fourRules = "+"
            case "ひき算":
                fourRules = "-"
            default:
                fourRules = "+"
        }

        // ヘルプで登録されたtotal値を取得　未登録時は10とする
        let value = (UserDefaults.standard.object(forKey: "total")  as? String ?? "10")
        totalNumber = Int(value)!

        // 問題出題
        setQuestions()
        
    }
    
    // Result へ値を引き渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let resultVC = segue.destination as? Result31ndViewController {
            resultVC.result = result
        }
    }
    
    // タイトルラベル
    @IBOutlet weak var titleLabel: UILabel!
    
    // 処理件数ラベル
    @IBOutlet weak var questionLabel: UILabel!
    // 上側ラベル
    @IBOutlet weak var leftNumLabel: UILabel!
    // 中央ラベル
    @IBOutlet weak var centralNumLabel: UILabel!
    // 下側ラベル
    @IBOutlet weak var rightNumLabel: UILabel!
    // 四則演算ラベル
    @IBOutlet weak var fourRulesLabel: UILabel!
    // 入力値
    @IBOutlet weak var showLabel: UILabel!
    // 戻るボタン
    @IBAction func modoruButton(_ sender: Any) {
        // １つ前の画面に戻る
        self.dismiss(animated: true, completion: nil)
    }
    // 正・誤の表示
    @IBOutlet weak var answerImage: UIImageView!
    // 次へのボタン
    @IBAction func nextButton(_ sender: UIButton) {
        // 開始からの経過秒数を取得する
        let timeInterval = Date().timeIntervalSince(questionstartTime)
        let time = Int(timeInterval)
        let timeWk = processTime(timer: time)
        // 全問処理時間計測
        totalTime = totalTime + time

        // 正・誤の表示
        if showLabel.text == answerNumber {
            answerImage.image = UIImage(named:"maru")
            correctNumber = correctNumber + 1
            judgment = "○"
        } else {
            answerImage.image = UIImage(named:"batu")
            judgment = "×"
        }
        // 正・誤を消去する
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.answerImage.image = UIImage(named:"space")
        }
        // 計算結果（１行の明細を出力）
        if leftNumLabel.text == "" {
            resultLine = sp + judgment + sp +
                        "[" + timeWk + "]" +
                        "(" + String(format: "%3d",Int(answerNumber)!) + ")" +
                         sp + centralNumLabel.text! +
                         fourRules +
                         rightNumLabel.text! +
                         "=" + showLabel.text!
        } else {
            resultLine = sp + judgment + sp +
                        "[" + timeWk + "]" +
                        "(" + String(format: "%3d",Int(answerNumber)!) + ")" +
                        sp + leftNumLabel.text! +
                        fourRules +
                        centralNumLabel.text! +
                        fourRules +
                        rightNumLabel.text! +
                        "=" + showLabel.text!
        }
        result.append(resultLine)
        showLabel.text = ""

        // 問題数に１を加える
        questionNumber += 1
        
        // 問題数が最大値を超えたら result 画面へ その他の場合は setQuestions へ
        if questionNumber >= totalNumber {
            let timeWk = processTime(timer: totalTime)
            // 計算結果（トータル時間を出力）
            resultLine = sp + sp + "トータル時間：" + timeWk
            totalTime = 0
            result.append(resultLine)
            // 計算結果（正：件数　誤：件数を出力）
            resultLine = sp + sp + "○：\(correctNumber)   ×：\(totalNumber - correctNumber)"
            result.append(resultLine)
            performSegue(withIdentifier: "Result31ndView", sender: nil)
        } else {
            // 計算処理を行う
            setQuestions()
        }
    }
    // 数値の入力
    @IBAction func inputNum(_ sender: UIButton) {
        guard let sendereNum = sender.titleLabel?.text else {
            return
        }
        guard let showNum = showLabel?.text else {
            return
        }
        // 先頭が０の場合
        showLabel.text = showNum + sendereNum
        var showLabelChk = showLabel.text!
        let cnt = showLabelChk.count
        if ( cnt == 2) && ( showLabelChk.prefix(1) == "0") {
            showLabel.text = String(showLabelChk.suffix(showLabelChk.count - 1))
            showLabelChk = showLabel.text!
        }
        // ９９９までの回答とする
        let showLabelInt:Int = Int(showLabelChk)!
        if showLabelInt > 100000 {
            var showLabelx:String
            var showLabelxx:String
            if showLabel.text != "" {
                showLabelx = showLabel.text!
                showLabelxx = String(showLabelx.prefix(showLabelx.count - 1))
                showLabel.text = showLabelxx
            }
        }
        let KernAttr=[NSAttributedString.Key.kern:5]
        showLabel.attributedText=NSMutableAttributedString(string:showLabel.text!,attributes:KernAttr)
    }
     // ＡＣボタン
     @IBAction func allClearButton(_ sender: UIButton) {
         showLabel.text = ""
     }
    // Ｃボタン
     @IBAction func clearButton(_ sender: UIButton) {
         var showLabelx:String
         var showLabelxx:String
         if showLabel.text != "" {
             showLabelx = showLabel.text!
             showLabelxx = String(showLabelx.prefix(showLabelx.count - 1))
             showLabel.text = showLabelxx
         }
     }
    
    //*********************************************************************
    // 問題出題
    //*********************************************************************
    func setQuestions() {
        showLabel.text = ""                     // 入力値をスペースにする
        var leftNumber = 0              // 左側値
        var centralNumber = 0           // 中央値
        var rightNumber = 0             // 右側値

        //  処理件数ラベルを表示
        questionLabel.text = "(" + String(questionNumber + 1) + "/" + String(totalNumber) + ")"

        // 開始時点の時刻をセットする
        questionstartTime = Date()
        switch selection[1] {
            case "３桁の足し算":
                leftNumber = 0
                centralNumber = Int.random(in: 100..<1000)
                rightNumber =  Int.random(in: 100..<1000)
                fourRules = "+"
            case "４桁の足し算":
                leftNumber = 0
                centralNumber = Int.random(in: 1000..<10000)
                rightNumber =  Int.random(in: 1000..<10000)
                fourRules = "+"
            case "３桁の引き算":
                leftNumber = 0
                centralNumber = Int.random(in: 100..<1000)
                randomX = centralNumber
                rightNumber = Int.random(in: 100..<randomX + 1)
                fourRules = "-"
            case "４桁の引き算":
                leftNumber = 0
                centralNumber = Int.random(in: 1000..<10000)
                randomX = centralNumber
                rightNumber = Int.random(in: 1000..<randomX + 1)
                fourRules = "-"
            default:
                leftNumber = 0
                centralNumber = Int.random(in: 1..<10)
                rightNumber = Int.random(in: 1..<10)
                fourRules = "+"
        }
        if leftNumber == 0 {
            leftNumLabel.text = ""
        } else {
            leftNumLabel.text = String(leftNumber)
        }
        centralNumLabel.text = String(centralNumber)
        rightNumLabel.text = String(rightNumber)
        fourRulesLabel.text = fourRules

        switch selection[1] {
            case "３桁の足し算":
                answerNumber = "\(leftNumber + centralNumber + rightNumber)"
            case "４桁の足し算":
                answerNumber = "\(leftNumber + centralNumber + rightNumber)"
            case "３桁の引き算":
                answerNumber = "\(centralNumber - rightNumber)"
            case "４桁の引き算":
                answerNumber = "\(centralNumber - rightNumber)"

            default:
                answerNumber = "\(leftNumber + centralNumber + rightNumber)"
        }
        let KernAttr=[NSAttributedString.Key.kern:5]
        leftNumLabel.attributedText=NSMutableAttributedString(string:leftNumLabel.text!,attributes:KernAttr)
        centralNumLabel.attributedText=NSMutableAttributedString(string:centralNumLabel.text!,attributes:KernAttr)
        rightNumLabel.attributedText=NSMutableAttributedString(string:rightNumLabel.text!,attributes:KernAttr)
        showLabel.attributedText=NSMutableAttributedString(string:showLabel.text!,attributes:KernAttr)
    }
    //*********************************************************************
    //  経過時間を文字タイプに変換
    //*********************************************************************
    func processTime(timer: Int) -> String {
        var times = ""
        let m = timer / 60 % 60
        let s = timer % 60
        if m == 0 {
            times = String(format: "%2d秒", s)
        } else {
            times = String(format: "%d分%d秒", m, s)
        }
        return times
    }
}
