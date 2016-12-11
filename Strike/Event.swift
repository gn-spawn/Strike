//
//  ToDo.swift
//  Strike
//
//  Created by Spawn on 2016/11/08.
//  Copyright © 2016年 Spawn. All rights reserved.
//

import Foundation
import RealmSwift

class Event: Object {
    dynamic var title = ""
    dynamic var releaceDate: Date?
    dynamic var hasPurchased = false
    dynamic var deadLineDate: Date?
    dynamic var hasPaid = false
    dynamic var showDate: Date?
    dynamic var isToday = false
}
