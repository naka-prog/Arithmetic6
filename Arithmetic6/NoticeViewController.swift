//
//  NoticeViewController.swift
//  CalcuApp
//
//  Created by koji nakashima on 2021/01/18.
//

import UIKit
import MessageUI

class NoticeViewController: UIViewController,MFMailComposeViewControllerDelegate  {
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    // 戻る
    @IBAction func modoruButton(_ sender: Any) {
        // １つ前の画面に戻る
        self.dismiss(animated: true, completion: nil)
    }
            
    @IBAction func mailTapped(sender: AnyObject) {
        //メールが送信できるかどうかの確認は必ず必要
        if MFMailComposeViewController.canSendMail() {
            let e = MFMailComposeViewController()
            e.mailComposeDelegate = self //delegateの設定
            e.setToRecipients(["nakasima@uncia-wks.co.jp"]) //宛先アドレス
    //      e.setCcRecipients([""]) //CCアドレス
    //      e.setBccRecipients([""]) //BCCアドレス
            e.setSubject("XXについて") //サブジェクト
            e.setMessageBody("", isHTML: false) //メール本文
            present(e, animated: true, completion: nil) //メール作成画面呼び出し
        } else {
            print("送信できません")
        }
    }
        
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        switch result {
            case .cancelled:
                print("Email Send Cancelled")
                break
            case .saved:
                print("Email Saved as a Draft")
                break
            case .sent:
                print("Email Sent Successfully")
                break
            case .failed:
                print("Email Send Failed")
                break
            default:
                break
        }
        controller.dismiss(animated: true, completion: nil)
    }

}

