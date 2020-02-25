//
//  FutureTableViewController.swift
//  iOS-Course-App
//
//  Created by grade on 20.02.20.
//  Copyright © 2020 TsvetoslavVasev. All rights reserved.
//

import UIKit

class FutureTableViewController: UITableViewController {

    var user: User?
    var loggedIn: Bool?
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
        self.loggedIn = user?.loggedIn
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
        return model?.futureCourses.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "futureCell", for: indexPath)

        Utilities.styleTableViewCell(cell)
        
        let course = model?.futureCourses[indexPath.row]
        cell.textLabel?.text = course?.year
        cell.imageView?.image = UIImage(named: "swift")
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         self.performSegue(withIdentifier: "projectsSegue", sender:nil)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let login = loggedIn {
            if !login {
                let frame = tableView.frame
                let loginImage = UIImage(named: "login")
                let loginButton = UIButton(frame: CGRect(x: 325,y: 0,width: 25,height: 50))
                loginButton.tag = section
                let color = UIColor.init(red: 115/255, green: 150/255, blue: 246/255, alpha: 0)
                loginButton.setTitle("Login", for: .normal)
                loginButton.setTitleColor(color, for: .normal)
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let index = tableView.indexPathForSelectedRow else {
            return
        }
        let projects = model?.futureCourses[index.row].projects
        (segue.destination as? CourseProjectsTableViewController)?.projects = projects
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
