//
//  EditEventViewController.swift
//  Strike
//
//  Created by Spawn on 2016/12/09.
//  Copyright © 2016年 Spawn. All rights reserved.
//

import Foundation
import Eureka

class EditViewController: FormViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Eurekaを使ったフォーム生成
        form +++ Section()
            <<< TextRow("TextField") {
                $0.placeholder = "イベント名"
        }
    }
}
