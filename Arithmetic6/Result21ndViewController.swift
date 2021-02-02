//
//  Result21ndViewController.swift
//  Arithmetic5
//
//  Created by koji nakashima on 2021/01/30.
//

import UIKit

class Result21ndViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {

    var result:[String] = []

    // 戻るボタン
    @IBAction func modoruButton1(_ sender: Any) {
        // ２階層前の画面に戻る
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)

    }

    @IBOutlet weak var result21ndView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        result21ndView.dataSource = self
        result21ndView.delegate = self
        print("Quiz → \(result)")
    }

    // テーブルの行数を指定するメソッド
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return result.count
    }
    
    // セルの中身を設定するメソッド
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得する
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier:"Mycell", for:indexPath)
        // セルに値を設定する
        cell.textLabel!.text = result[indexPath.row]
        cell.textLabel?.font = UIFont(name:"Menlo", size: 20)
        return cell
    }
}
