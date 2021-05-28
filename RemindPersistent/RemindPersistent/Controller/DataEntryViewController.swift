//
//  DataEntryViewController.swift
//  MiniRemindersII
//
//  Created by Daniel Akinniranye on 3/4/21.
//

import UIKit

class DataEntryViewController: UIViewController {

    
    @IBOutlet weak var reminderTextField: UITextField!
    @IBOutlet weak var categoryTextField: UITextField!

    @IBOutlet var dueDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tf1 = reminderTextField.inputAssistantItem
        tf1.leadingBarButtonGroups = []
        tf1.trailingBarButtonGroups = []
        
        let tf2 = categoryTextField.inputAssistantItem
        tf2.leadingBarButtonGroups = []
        tf2.trailingBarButtonGroups = []
    }
    
    @IBAction func addReminder(_ sender: Any) {
        let lAppDelegate = UIApplication.shared.delegate as! AppDelegate
        let lDataModel = lAppDelegate.myRemindersData
    
        lDataModel.addEvent(content: reminderTextField.text ?? "Smile", category: categoryTextField.text ?? "Mood", dueDate: dueDatePicker.date, done: false)
        
        reload()
        clearEntries()
    }
   
    func reload() {
        if let lSplitViewController = self.splitViewController {
            
            let lSiblingViewControllers = lSplitViewController.viewControllers
                
                if let lNavigationController = lSiblingViewControllers[0] as? UINavigationController {
                    if let lTableViewController = lNavigationController.viewControllers.first as? UITableViewController {
                        lTableViewController.tableView.reloadData()
                }
            }
        }
    }
    
    func clearEntries() {
        reminderTextField!.text = ""
        categoryTextField!.text = ""
    }
    
}

