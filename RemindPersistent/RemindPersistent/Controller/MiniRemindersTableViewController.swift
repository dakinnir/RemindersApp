//
//  MiniRemindersTableDataEntryViewController.swift
//  MiniReminders
//
//  Created by Daniel Akinniranye on 3/9/21.
//

import UIKit

class MiniRemindersTableViewController: UITableViewController {
    
    let lAppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.tableView.reloadData()


        


        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let lDataModel = lAppDelegate.myRemindersData

        
        return lDataModel.myData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let lDataModel = lAppDelegate.myRemindersData

        let cell = tableView.dequeueReusableCell(withIdentifier: "ShowRemindersTableView", for: indexPath) as! MiniRemindersTableViewCell
        
        cell.reminderLabel?.text = "Reminder: \(lDataModel.myData[indexPath.row].theContent)"
        cell.categoryLabel?.text = "Category: \(lDataModel.myData[indexPath.row].theCategory)"
        cell.dateLabel?.text = "Date Due: \(lDataModel.myData[indexPath.row].theDate)"
        cell.doneLabel?.text = "Completed: \(lDataModel.myData[indexPath.row].theDoneFlag)"

    
         // Configure the cell...
        cell.backgroundColor = UIColor.systemPink
        return cell
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
