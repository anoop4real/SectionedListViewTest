//
//  ViewController.swift
//  SectionedTableViewSample
//
//  Created by anoopm on 29/10/17.
//  Copyright © 2017 anoopm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var studentTableView:UITableView!
    @IBOutlet private weak var sortControl:UISegmentedControl!
    let store = StudentDataStore.shared()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        store.sortWith(filter: .byName)
        print(store.sectionCount())
        print(store.rowsCountIn(section: 0))
        print(store.itemAt(section: 0, row: 0)!)
        
        studentTableView.reloadData()
        studentTableView.rowHeight = UITableViewAutomaticDimension
        studentTableView.estimatedRowHeight = 100.0
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func indexChanged(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex
        {
        case 0:
            store.sortWith(filter: .byName)
            studentTableView.reloadData()
        //show popular view
        case 1:
            store.sortWith(filter: .byGrade)
            studentTableView.reloadData()
        //show history view
        default:
            break;
        }
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int{
        
        return store.sectionCount()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return store.rowsCountIn(section: section)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "studentCell", for: indexPath) as! StudentTableViewCell
        if let item = store.itemAt(section: indexPath.section, row: indexPath.row){
            cell.configureCellWith(student: item)
        }
     return cell
     }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
        return store.headerNameFor(section: section)
    }
}

