//
//  CurrentCoursesTableViewController.swift
//  iOS-Course-App
//
//  Created by Demetra Staykova on 20.02.20.
//  Copyright © 2020 TsvetoslavVasev. All rights reserved.
//

import UIKit

class PresentCoursesTableViewController: UITableViewController {

    var user: User?
    var model: Model?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupElements()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    func setupData() {
        let decoder = JSONDecoder()
        do {
            self.model = try decoder.decode(Model.self, from: json)
        } catch let err {
            print(err)
        }
    }
    
    func setupElements() {
        Utilities.styleTableView(self.tableView)
    }
    
    @objc func headerButtonTabbed(sender: UIButton!) {
        guard let user = self.user, let loginVC = self.storyboard?.instantiateViewController(identifier: "loginVC") as? LoginViewController, let profileVC = self.storyboard?.instantiateViewController(identifier: "profileVC") as? ProfileViewController else {
            return
        }
        if user.loggedIn {
            profileVC.user = self.user
            self.navigationController?.pushViewController(profileVC, animated: true)
        } else {
            self.navigationController?.pushViewController(loginVC, animated: true)
        }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return model?.presentCourses.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "presentCell", for: indexPath)
        
        Utilities.styleTableViewCell(cell)
        
        let course = model?.presentCourses[indexPath.row]
        cell.textLabel?.text = course?.year
        cell.imageView?.image = UIImage(named: "swift")
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         guard let courseProjectsTVC = self.storyboard?.instantiateViewController(identifier: "courseProjectsTVC") as? CourseProjectsTableViewController, let index = tableView.indexPathForSelectedRow else {
              return
         }
        let course = model?.presentCourses[index.row]
        courseProjectsTVC.projects = course?.projects
        courseProjectsTVC.courseTitle = course?.year
        courseProjectsTVC.user = self.user
        self.navigationController?.pushViewController(courseProjectsTVC, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let user = self.user {
            let frame = tableView.frame
            let headerButton = UIButton(frame: CGRect(x: tableView.frame.width - 50,y: 0,width: 35,height: 50))
            headerButton.translatesAutoresizingMaskIntoConstraints = true
            
            if !user.loggedIn {
                let loginImage = UIImage(named: "login")
                headerButton.setImage(loginImage, for: .normal)
                
            } else {
                let profileImage = UIImage(named: "profile")
                headerButton.setImage(profileImage, for: .normal)
            }
            headerButton.addTarget(self, action: #selector(headerButtonTabbed), for: .touchUpInside)
            let header = UIView(frame: CGRect(x: 0,y: 0, width: frame.width, height: frame.height))
            header.addSubview(headerButton)
                
            return header
        }
        
        return UIView()
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if let _ = self.user {
                 return CGFloat(50)
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
