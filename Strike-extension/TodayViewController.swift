//
//  TodayViewController.swift
//  Strike-extension
//
//  Created by Spawn on 2016/12/18.
//  Copyright © 2016年 Spawn. All rights reserved.
//

import UIKit
import NotificationCenter
import RealmSwift

class TodayViewController: UIViewController, NCWidgetProviding {
    
    var realm: Realm!
    var eventList: Results<Event>{
        get {
            return realm.objects(Event.self)
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
        let directory: URL = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "group.com.otintin.strike")!
        var config = Realm.Configuration()
        config.fileURL = directory.deletingLastPathComponent()
            .appendingPathComponent("db.realm")
        Realm.Configuration.defaultConfiguration = config
        do {
            realm = try! Realm()
        } catch  {
            print(error)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let event = eventList[indexPath.row]
        
        cell.textLabel!.text = event.title
        cell.detailTextLabel!.text = "\(event.deadLineDate)"
        
        return cell
        
    }
}
