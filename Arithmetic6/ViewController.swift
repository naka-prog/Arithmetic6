//
//  ViewController.swift
//  Arithmetic
//
//  Created by koji nakashima on 2021/01/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    // 小学１年生
    @IBAction func grade1Button(_ sender: UIButton) {
        performSegue(withIdentifier: "Grade1ndView", sender:nil)
    }
    // 小学２年生
    @IBAction func grade2Button(_ sender: UIButton) {
        performSegue(withIdentifier: "Grade2ndView", sender:nil)
    }
    // 小学３年生
    @IBAction func grade3Button(_ sender: UIButton) {
        performSegue(withIdentifier: "Grade3ndView", sender:nil)
    }
    
    @IBAction func helpButton(_ sender: UIButton) {
        performSegue(withIdentifier: "HelpView", sender:nil)
    }
    
    @IBAction func NoticeView(_ sender: UIButton) {
        performSegue(withIdentifier: "NoticeView", sender:nil)
    }
    

}
