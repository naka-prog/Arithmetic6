//
//  HelpViewController.swift
//  CalcuApp
//
//  Created by koji nakashima on 2021/01/18.
//

import UIKit

class HelpViewController: UIViewController, UITextFieldDelegate  {
    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // 戻る
    @IBAction func modoruButton(_ sender: Any) {
        // １つ前の画面に戻る
        self.dismiss(animated: true, completion: nil)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //もしUserDefaultsに値が登録されてるなら
        if let _ = UserDefaults.standard.object(forKey: "total") as? String {
            //labelに表示
            Label.text = (UserDefaults.standard.object(forKey: "total") as! String)
        }
        
        // textFieldへのターゲット設定の処理を追加
        textField.addTarget(self, action: #selector(textFieldEditingChanged(textField:)), for: .editingChanged)
        
    }
    // textFieldへの文字制限
    var maxLength: Int = 2
    @objc func textFieldEditingChanged(textField: UITextField) {
        guard let text = textField.text else { return }
        textField.text = String(text.prefix(maxLength))
    }
    
    //  問題数を表示
    @IBAction func registerButton(_ sender: Any) {
        //UserDefaultsに値を登録
        if textField.text == "" {
            textField.text = "10"
        }
        if textField.text == "00" {
            textField.text = "01"
        }
        UserDefaults.standard.set(textField.text, forKey: "total")
        //登録された値を表示する
        Label.text = (UserDefaults.standard.object(forKey: "total") as! String)
    }
    
    //画面をタップした時
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //キーボードを閉じる
        textField.resignFirstResponder()
    }
    
}
