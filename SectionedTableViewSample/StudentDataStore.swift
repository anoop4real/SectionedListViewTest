//
//  StudentDataStore.swift
//  SectionedTableViewSample
//
//  Created by anoopm on 29/10/17.
//  Copyright © 2017 anoopm. All rights reserved.
//

import Foundation

enum DataFilter: Int{
    case byName = 0
    case byDate
    case byGrade
}
class StudentDataStore {
    
    private var studentsArray = [Student]()
    private var isDataloaded = false
    fileprivate var currentFilter:DataFilter = .byName
    fileprivate var sortedDataByName:[(String, [Student])] = []
    fileprivate var sortedDataByGrade:[(String, [Student])] = []
    fileprivate var sortedDataByDOJ:[String : [Student]] = [:]
    
    private static let sharedStore = StudentDataStore()
    
    private init(){
        
    }
    
    class func shared() -> StudentDataStore{
        
        return sharedStore
    }
    
    private func loadInitialData(){
        
        if (!isDataloaded){
            prepareData()
        }
    }
    
    private func prepareData(){
        
        var student = Student(name: "David Mark", age: 25, grade: "C", dateOfBirth: "1985-06-20", dateOfJoining: "2016-07-20")
        studentsArray.append(student)
        
        student = Student(name: "Mark Angel", age: 24, grade: "A", dateOfBirth: "1985-08-20", dateOfJoining: "2016-07-25")
        studentsArray.append(student)
        
        student = Student(name: "Don Angel", age: 21, grade: "B", dateOfBirth: "1984-08-20", dateOfJoining: "2016-06-25")
        studentsArray.append(student)
        
        student = Student(name: "Angel Noeman", age: 22, grade: "C", dateOfBirth: "1985-07-20", dateOfJoining: "2016-09-25")
        studentsArray.append(student)
        
        student = Student(name: "John Mark", age: 26, grade: "D", dateOfBirth: "1984-07-20", dateOfJoining: "2017-01-25")
        studentsArray.append(student)
        
        student = Student(name: "John Angel", age: 21, grade: "B", dateOfBirth: "1985-05-20", dateOfJoining: "2016-10-25")
        studentsArray.append(student)
        
        student = Student(name: "David Jon", age: 25, grade: "A", dateOfBirth: "1986-08-20", dateOfJoining: "2016-07-25")
        studentsArray.append(student)
        
        student = Student(name: "Bane Angel", age: 25, grade: "C", dateOfBirth: "1984-03-20", dateOfJoining: "2016-08-25")
        studentsArray.append(student)
        
        student = Student(name: "Bruce Angel", age: 25, grade: "C", dateOfBirth: "1984-02-20", dateOfJoining: "2016-03-25")
        studentsArray.append(student)
        
        student = Student(name: "Zangief Angel", age: 28, grade: "D", dateOfBirth: "1984-06-20", dateOfJoining: "2017-02-25")
        studentsArray.append(student)
        
/////////
        student = Student(name: "Mark Angel", age: 24, grade: "A", dateOfBirth: "1985-08-20", dateOfJoining: "2016-07-25")
        studentsArray.append(student)
        
        student = Student(name: "Don Angel", age: 21, grade: "B", dateOfBirth: "1984-08-20", dateOfJoining: "2016-06-25")
        studentsArray.append(student)
        
        student = Student(name: "Angel Noeman", age: 22, grade: "C", dateOfBirth: "1985-07-20", dateOfJoining: "2016-09-25")
        studentsArray.append(student)
        
        student = Student(name: "John Mark", age: 26, grade: "D", dateOfBirth: "1984-07-20", dateOfJoining: "2017-01-25")
        studentsArray.append(student)
        
        student = Student(name: "John Angel", age: 21, grade: "B", dateOfBirth: "1985-05-20", dateOfJoining: "2016-10-25")
        studentsArray.append(student)
        
        student = Student(name: "David Jon", age: 25, grade: "A", dateOfBirth: "1986-08-20", dateOfJoining: "2016-07-25")
        studentsArray.append(student)
        
        student = Student(name: "Bane Angel", age: 25, grade: "C", dateOfBirth: "1984-03-20", dateOfJoining: "2016-08-25")
        studentsArray.append(student)
        
        student = Student(name: "Bruce Angel", age: 25, grade: "C", dateOfBirth: "1984-02-20", dateOfJoining: "2016-03-25")
        studentsArray.append(student)
        
        student = Student(name: "Zangief Angel", age: 28, grade: "D", dateOfBirth: "1984-06-20", dateOfJoining: "2017-02-25")
        studentsArray.append(student)
        
    }
    private func sortDataByName(){
        
        let names = studentsArray.flatMap({$0.name.characters.prefix(1)})
        var dict:[String : [Student]] = [:]
        for key in names{
            let filrered = studentsArray.filter({$0.name.hasPrefix(String(key))})
            dict[String(key)] = filrered
        }
        self.sortedDataByName = dict.sorted(by: {$0.key < $1.key})
        //let sortedDict = dict.sorted(by: {$0.key < $1.key})
    }
    private func sortDataByGrade(){
        
        let names = studentsArray.flatMap({$0.grade})
        var dict:[String : [Student]] = [:]
        for key in names{
            let filrered = studentsArray.filter({$0.grade == key})
            dict[String(key)] = filrered
        }
        self.sortedDataByGrade = dict.sorted(by: {$0.key < $1.key})
        //let sortedDict = dict.sorted(by: {$0.key < $1.key})
    }
    
    func sortWith(filter: DataFilter){
        
        loadInitialData()
        switch filter {
        case DataFilter.byName:
            currentFilter = filter
            sortDataByName()
        case DataFilter.byGrade:
            currentFilter = filter
            sortDataByGrade()
        default:
            break
        }
        
    }
}

extension StudentDataStore: DataStoreProtocol{
    
    func sectionCount() ->Int{
        
        switch currentFilter {
        case DataFilter.byName:
            return self.sortedDataByName.count
        case DataFilter.byGrade:
            return self.sortedDataByGrade.count
        default:
            return 0
        }
    }
    func rowsCountIn(section: Int) ->Int{
        
        var rowCount = 0
        let data = getDataByCurrentFilterFor(section: section)
        
        if !data.students.isEmpty{
            rowCount = data.students.count
        }
        return rowCount
    }
    func itemAt(section:Int, row: Int) ->Student?{
     
        let data = getDataByCurrentFilterFor(section: section)
        
        if !data.students.isEmpty{
            let student = data.students[row]
            return student
        }
        return nil
    }
    func headerNameFor(section: Int) -> String{
        let data = getDataByCurrentFilterFor(section: section)
        
        return data.key
    }
    
    private func getDataByCurrentFilterFor(section: Int) -> (key:String,students: [Student]){
        
        switch currentFilter {
        case DataFilter.byName:
            let data = self.sortedDataByName[section]
            return data
        case DataFilter.byGrade:
            let data = self.sortedDataByGrade[section]
            return data
        default:
            return ("",[])
        }
    }
}







