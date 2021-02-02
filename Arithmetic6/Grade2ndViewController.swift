//
//  Grade2ndViewController.swift
//  Arithmetic5
//
//  Created by koji nakashima on 2021/01/30.
//

import UIKit

class Grade2ndViewController: UIViewController {
    
    var selection:[String] = []    // 次の画面への引き渡し

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    // 戻る
    @IBAction func modoruButton(_ sender: Any) {
        // １つ前の画面に戻る
        self.dismiss(animated: true, completion: nil)
    }
    // たし算のボタン押下時の処理
    @IBAction func addButton(_ sender: UIButton) {
        guard let sendereName = sender.titleLabel?.text else {
            return
        }
        let selectionCode = sendereName.replacingOccurrences(of: " ", with: "")
        selection.removeAll()
        selection.append("たし算")
        selection.append(selectionCode)
        print(selection[0]+":"+selection[1])
        performSegue(withIdentifier: "Quiz21ndView", sender:nil)
    }
    
    // ひき算のボタン押下時の処理
    @IBAction func subButton(_ sender: UIButton) {
        guard let sendereName = sender.titleLabel?.text else {
            return
        }
        let selectionCode = sendereName.replacingOccurrences(of: " ", with: "")
        selection.removeAll()
        selection.append("ひき算")
        selection.append(selectionCode)
        print(selection[0]+":"+selection[1])
        performSegue(withIdentifier: "Quiz21ndView", sender:nil)
    }

    // かけ算のボタン押下時の処理
    @IBAction func multiButton(_ sender: UIButton) {
        guard let sendereName = sender.titleLabel?.text else {
            return
        }
        let selectionCode = sendereName.replacingOccurrences(of: " ", with: "")
        selection.removeAll()
        selection.append("かけ算")
        selection.append(selectionCode)
        print(selection[0]+":"+selection[1])
        performSegue(withIdentifier: "Quiz22ndView", sender:nil)
    }

    // Quiz21&22ndViewへ値を引き渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Quiz21ndView" {
            if let selectionVC = segue.destination as? Quiz21ndViewController {
                selectionVC.selection = selection
            }
        } else if segue.identifier == "Quiz22ndView" {
            if let selectionVC = segue.destination as? Quiz22ndViewController {
                selectionVC.selection = selection
            }
        }
    }
}

