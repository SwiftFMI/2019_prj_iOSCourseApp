//
//  CourseProjectsTableViewController.swift
//  iOS-Course-App
//
//  Created by TsvetoslavVasev on 20.02.20.
//  Copyright © 2020 TsvetoslavVasev. All rights reserved.
//

import UIKit

class CourseProjectsTableViewController: UITableViewController {
    
    var courseTitle: String?
    var projects: [Project]?
    var loggedIn: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupElements()
        setupData()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    func setupData() {
        if let courseTitle = courseTitle {
            let course = courseTitle.components(separatedBy: "_");
            let title = course[0] + " " + course[1] + "/" + course[2]
            self.title = title
        } else {
            self.title = "Projects"
        }
    }
    
    func setupElements() {
        Utilities.styleTableView(self.tableView)
        Utilities.resizeTableView(self.tableView)
        
        if self.projects?.count == 0 {
            self.tableView.allowsSelection = false
        }
    }

    
    @objc func loginButtonTabbed(sender: UIButton!) {
        guard let loginVC = self.storyboard?.instantiateViewController(identifier: "loginVC") as? LoginViewController else {
            return
        }
        self.navigationController?.pushViewController(loginVC, animated: true)
    }
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if let projects = projects {
            if projects.count > 0 {
                return projects.count
            }
        }
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "projectCell", for: indexPath) as! CourseProjectTableViewCell
        
        Utilities.styleTableViewCell(cell)
        
        if let projects = projects {
            if projects.count > 0 {
                let project = projects[indexPath.row]
                cell.projectTitleLabel?.text = project.name
                cell.projectImageView?.image = UIImage(named: project.image)
                let years = project.courseYear.components(separatedBy: "_")
                let info = "winter semester, " + years[1] + "/" + years[2] + " school year"
                cell.projectInfoLabel.text = info
            } else {
                cell.projectTitleLabel?.text = "Sorry, no projects to display!"
                cell.projectInfoLabel?.text = "Course info comming soon..."
                cell.projectImageView?.image = UIImage(named: "default-project-image")
            }
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let projectDetailsVC = self.storyboard?.instantiateViewController(identifier: "projectDetailsVC") as? ProjectViewController, let index = tableView.indexPathForSelectedRow else {
              return
        }
        
        let projects = self.projects?[index.row]
        projectDetailsVC.projectInfo = projects
        self.navigationController?.pushViewController(projectDetailsVC, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let login = loggedIn {
            if !login {
                let frame = tableView.frame
                let loginImage = UIImage(named: "login")
                let loginButton = UIButton(frame: CGRect(x: 325,y: 0,width: 25,height: 50))
                loginButton.setImage(loginImage, for: .normal)
                loginButton.addTarget(self, action: #selector(loginButtonTabbed), for: .touchUpInside)
                
                let loginHeader = UIView(frame: CGRect(x: 0,y: 0, width: frame.width, height: frame.height))
                loginHeader.addSubview(loginButton)
                
                return loginHeader
            }
        }
        
        return UIView()
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if let login = loggedIn {
            if !login {
                 return CGFloat(50)
            }
        }
        return CGFloat(0)
    }
 
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
