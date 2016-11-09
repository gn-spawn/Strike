//
//  InputViewController.swift
//  Strike
//
//  Created by Spawn on 2016/11/08.
//  Copyright © 2016年 Spawn. All rights reserved.
//

import UIKit
import RealmSwift

class InputViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        titleTextField.frame.size.width = 114
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addTodo(_ sender: Any) {
        let newTodo = ToDo()
        
        newTodo.title = titleTextField.text!
        
        do {
            let realm = try Realm()
            try realm.write({ () -> Void in
                realm.add(newTodo)
                print("Todo Saved")
            })
        } catch {
            print("Failed")
        }
        _ = self.navigationController?.popToRootViewController(animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
