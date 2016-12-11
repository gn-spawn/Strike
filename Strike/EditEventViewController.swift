//
//  EditEventViewController.swift
//  Strike
//
//  Created by Spawn on 2016/12/09.
//  Copyright © 2016年 Spawn. All rights reserved.
//

import Foundation
import Eureka
import RealmSwift

class EditViewController: FormViewController {

    
    @IBAction func onSave(_ sender: UIBarButtonItem) {
        // バリデーションする必要あり
        let row: TextRow? = form.rowBy(tag: "EventTitleRow")
        let event = Event()
        event.title = (row?.value)!
        
        do {
            let reaml = try Realm()
            try reaml.write({ () -> Void in
                reaml.add(event)
            })
        } catch  {
            print("保存失敗")
        }
        // ルートビューへ戻る
        _ = self.navigationController?.popToRootViewController(animated: true)

//        print(type(of: row?.value) ?? "イベント名が入ってない")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Eurekaを使ったフォーム生成
        form +++ Section()
            <<< TextRow("TextField") {
                $0.tag = "EventTitleRow"
                $0.placeholder = "イベント名"
                }
        
            +++ Section()
            <<< DateRow {
                $0.tag = "ReleaceDateRow"
                $0.title = "発売日"
                $0.value = Date()
            }
            <<< DateRow {
                $0.tag = "DeadLineDateRow"
                $0.title = "入金締め切り"
                $0.value = Date()
            }
            <<< DateRow {
                $0.tag = "ShowDateRow"
                $0.title = "公演日"
                $0.value = Date()
        }

    }
}
