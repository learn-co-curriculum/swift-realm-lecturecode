//
//  ViewController.swift
//  playingWithRealm
//
//  Created by Johann Kerr on 4/13/17.
//  Copyright © 2017 Johann Kerr. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    
    var students: Results<Student>!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        createCohort(name: "ios-0217")
        fetchCohorts()
        let student = Student(id: 5, name: "Kaypree")
        addStudent(student: student, to: "ios-0217")
        fetchCohorts()
        
        
    }
    
    
    func addStudent(student: Student, to cohort: String) {
        
        let realm = try! Realm()
        print(cohort)
        let cohorts = realm.objects(Cohort.self)
        for c in cohorts {
            if c.name == cohort {
                try! realm.write {
                    c.students.append(student)
                }
            }
        }
        
        
        
        
        
    }
    
    
    func fetchCohorts() {
        let realm = try! Realm()
        let cohorts = realm.objects(Cohort.self)
        print(cohorts)
    }
    
    func createCohort(name: String) {
        let cohort = Cohort(name: name)
        
        let realm = try! Realm()
        try! realm.write {
            realm.add(cohort, update: true)
        }
        
    }
    
    
    func createStudent(name:String, id:Int) {
        let student = Student(id: id, name: name)
        let realm = try! Realm()
        try! realm.write {
            realm.add(student)
        }
    }
    
    
    func fetchStudents() {
        let realm = try! Realm()
        self.students = realm.objects(Student.self)
    }
    
    
    
    
    
}

