//
//  Student.swift
//  playingWithRealm
//
//  Created by Johann Kerr on 4/13/17.
//  Copyright © 2017 Johann Kerr. All rights reserved.
//

import Foundation
import RealmSwift

class Student: Object {
    dynamic var id: Int = 0
    dynamic var name: String = ""
    let cohort = LinkingObjects(fromType: Cohort.self, property: "students")
    
    convenience init(id: Int, name: String) {
        self.init()
        self.id = id
        self.name = name
    }
    
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    
    
}

class Cohort: Object {
    dynamic var name: String = ""
    var students = List<Student>()
    
    //var students = [Student]()
    
    convenience init(name: String) {
        self.init()
        self.name = name
    }
}




