//
//  ToDoList.swift
//  Sha Todo List
//
//  Created by ArunSha on 20/04/21.
//

import Foundation
import RealmSwift
class ToDoListItem: Object {
    @objc dynamic var todoTitle:String = ""
    @objc dynamic var done: Bool = false
    @objc dynamic var itemCreatedDate: Date?
    // Inverse Relationship (to One)
    var parentToDOCategory = LinkingObjects(fromType: ToDoCategory.self, property: "toDOListItem")
}
