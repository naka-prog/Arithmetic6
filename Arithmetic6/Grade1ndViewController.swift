//
//  Grade1ndViewController.swift
//  Arithmetic
//
//  Created by koji nakashima on 2021/01/26.
//

import UIKit

class Grade1ndViewController: UIViewController {

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
        performSegue(withIdentifier: "Quiz11ndView", sender:nil)
    }
    @IBAction func add3Button(_ sender: UIButton) {
        guard let sendereName = sender.titleLabel?.text else {
            return
        }
        let selectionCode = sendereName.replacingOccurrences(of: " ", with: "")
        selection.removeAll()
        selection.append("たし算")
        selection.append(selectionCode)
        print(selection[0]+":"+selection[1])
        performSegue(withIdentifier: "Quiz12ndView", sender:nil)
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
        performSegue(withIdentifier: "Quiz11ndView", sender:nil)
    }
    @IBAction func sub3Button(_ sender: UIButton) {
        guard let sendereName = sender.titleLabel?.text else {
            return
        }
        let selectionCode = sendereName.replacingOccurrences(of: " ", with: "")
        selection.removeAll()
        selection.append("ひき算")
        selection.append(selectionCode)
        print(selection[0]+":"+selection[1])
        performSegue(withIdentifier: "Quiz12ndView", sender:nil)
    }

    // Quiz11ndViewへ値を引き渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Quiz11ndView" {
            if let selectionVC = segue.destination as? Quiz11ndViewController {
                selectionVC.selection = selection
            }
        } else if segue.identifier == "Quiz12ndView" {
            if let selectionVC = segue.destination as? Quiz12ndViewController {
                selectionVC.selection = selection
            }

        }
    }
}

