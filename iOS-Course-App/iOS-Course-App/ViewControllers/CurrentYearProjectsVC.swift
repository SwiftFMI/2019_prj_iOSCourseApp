//
//  CurrentYearProjectsVC.swift
//  iOS-Course-App
//
//  Created by Violeta Ilieva on 19.02.20.
//  Copyright © 2020 TsvetoslavVasev. All rights reserved.
//

import UIKit

class CurrentYearProjectsVC: UITableViewController {

    var projects: [Projects] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        createProjects()
    }

    
    func createProjects() {
        let project1 = Projects(image: "img1", title: "Coach Assistant Application")
        let project2 = Projects(image: "img2", title: "Fitness Application")
        let project3 = Projects(image: "img3", title: "Game Logger Application")
        let project4 = Projects(image: "img4", title: "Meme application")
        let project5 = Projects(image: "img5", title: "Movie DB Application")
        let project6 = Projects(image: "img6", title: "News Application")
        let project7 = Projects(image: "img7", title: "iOS Course Application")
        
        projects.append(project1)
        projects.append(project2)
        projects.append(project3)
        projects.append(project4)
        projects.append(project5)
        projects.append(project6)
        projects.append(project7)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         // #warning Incomplete implementation, return the number of rows
         return projects.count
     }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let project = projects[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "courseCell") as? courseCell
        
        cell.setProject(project: project)


        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: indexPath){
        myIndex = indexPath.row
        performSegue(withIdentifier: "segueToSpecificProject" ,sender: self)
        
        
    }
    

}


