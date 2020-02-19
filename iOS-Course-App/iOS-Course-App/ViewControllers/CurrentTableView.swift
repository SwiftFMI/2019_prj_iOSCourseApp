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


var myIndex = 0

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
        dataSource.append(Courses(courseTitle: "iOS with Swift 2019/2020"))
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: indexPath){
        myIndex = indexPath.row
        performSegue(withIdentifier: "segueToProjects" ,sender: self)
        
        
    }
}

