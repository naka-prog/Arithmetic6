//
//  Grade3ndViewController.swift
//  Arithmetic6
//
//  Created by koji nakashima on 2021/02/01.
//

import UIKit

class Grade3ndViewController: UIViewController {
    
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
        performSegue(withIdentifier: "Quiz31ndView", sender:nil)
    }
    // たし算(暗算)のボタン押下時の処理
    @IBAction func addMentalButton(_ sender: UIButton) {
        guard let sendereName = sender.titleLabel?.text else {
            return
        }
        let selectionCode = sendereName.replacingOccurrences(of: " ", with: "")
        selection.removeAll()
        selection.append("たし算")
        selection.append(selectionCode)
        print(selection[0]+":"+selection[1])
        performSegue(withIdentifier: "Quiz32ndView", sender:nil)
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
        performSegue(withIdentifier: "Quiz31ndView", sender:nil)
    }

    // ひき算(暗算)のボタン押下時の処理
    @IBAction func subMentalButton(_ sender: UIButton) {
        guard let sendereName = sender.titleLabel?.text else {
            return
        }
        let selectionCode = sendereName.replacingOccurrences(of: " ", with: "")
        selection.removeAll()
        selection.append("ひき算")
        selection.append(selectionCode)
        print(selection[0]+":"+selection[1])
        performSegue(withIdentifier: "Quiz32ndView", sender:nil)
    }

    //      わり算のボタン押下時の処理
    @IBAction func divisionButton(_ sender: UIButton) {
        guard let sendereName = sender.titleLabel?.text else {
            return
        }
        let selectionCode = sendereName.replacingOccurrences(of: " ", with: "")
        selection.removeAll()
        selection.append("わり算")
        selection.append(selectionCode)
        print(selection[0]+":"+selection[1])
        performSegue(withIdentifier: "Quiz32ndView", sender:nil)
    }

    // Quiz21&22ndViewへ値を引き渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Quiz31ndView" {
            if let selectionVC = segue.destination as? Quiz31ndViewController {
                selectionVC.selection = selection
            }
        } else if segue.identifier == "Quiz32ndView" {
            if let selectionVC = segue.destination as? Quiz32ndViewController {
                selectionVC.selection = selection
            }
        }
    }
}

