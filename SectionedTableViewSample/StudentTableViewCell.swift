//
//  StudentTableViewCell.swift
//  SectionedTableViewSample
//
//  Created by anoopm on 31/10/17.
//  Copyright © 2017 anoopm. All rights reserved.
//

import UIKit

class StudentTableViewCell: UITableViewCell {

    @IBOutlet weak var namelbl:UILabel!
    @IBOutlet weak var agelbl:UILabel!
    @IBOutlet weak var gradelbl:UILabel!
    @IBOutlet weak var dojlbl:UILabel!
    @IBOutlet weak var doblbl:UILabel!
    @IBOutlet weak var studentImg:UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCellWith(student: Student){
        
        namelbl.text = student.name
        agelbl.text  = String(student.age)
        gradelbl.text = student.grade
        doblbl.text = student.dateOfBirth
        dojlbl.text = student.dateOfJoining
    }

}
