//
//  CurrentTableView.swift
//  iOS-Course-App
//
//  Created by Violeta Ilieva on 19.02.20.
//  Copyright © 2020 TsvetoslavVasev. All rights reserved.
//

import UIKit

struct Courses {
    let courseTitle: String
}

class CurrentTableView : UIViewController{
    @IBOutlet weak var currTable: UITableView!

    var dataSource: [Courses] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currTable.dataSource = self
        currTable.delegate = self
        loadDataSource()
    }
    
    func loadDataSource() {
        dataSource.append(Courses(courseTitle: "iOS Course App"))
        dataSource.append(Courses(courseTitle: "iOS Course App"))
        dataSource.append(Courses(courseTitle: "iOS Course App"))
        dataSource.append(Courses(courseTitle: "iOS Course App"))
        dataSource.append(Courses(courseTitle: "iOS Course App"))
        dataSource.append(Courses(courseTitle: "iOS Course App"))
    }
}

extension CurrentTableView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currCell = tableView.dequeueReusableCell(withIdentifier: "currCell", for: indexPath) as! CourseTableViewCell
        
        let course = dataSource[indexPath.row]
        currCell.textLabel?.text = course.courseTitle
        return currCell
    }
}

