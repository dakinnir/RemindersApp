//
//  MiniRemindersDataModel.swift
//  RemindPersistent
//
//  Created by Daniel Akinniranye on 3/11/21.
//

import Foundation


class MiniRemindersDataModel {
    
    let fm = FileManager.default
    
    // let's store all reminders in an array of ReminderItem types:
    var myData : [ReminderItem] = [
    
        // testing with one sample reminder item
        // (NOTE to self: remove this in the final version of this app!
    ]
    
    

    func writeToFile() {
        do {
            let docsurl = try fm.url(for:.documentDirectory,
                    in: .userDomainMask, appropriateFor: nil, create: false)
            let fileP = docsurl.appendingPathComponent("reminder.plist")
            let data = try PropertyListEncoder().encode(myData)
            try data.write(to: fileP, options: .atomic)

        } catch {
            print(error)
        }
    }
        
    // write a method to add new events
    func addEvent(content : String, category : String, dueDate : Date, done : Bool){
        self.myData.append(ReminderItem(pContent: content, pCategory : category, pDate : dueDate, pDoneFlag : done))
        writeToFile()
    }
}

// a separate class, for one data entry in the Reminder List:

class ReminderItem : NSObject, Codable {
    var theContent : String
    var theCategory : String
    var theDate : Date
    var theDoneFlag : Bool
    
    init(pContent : String, pCategory : String, pDate : Date, pDoneFlag : Bool) {
        self.theContent = pContent
        self.theCategory = pCategory
        self.theDate = pDate
        
        // if the date entered is before the current date and time
        if (self.theDate <= Date(timeIntervalSinceNow: 0)) {
            self.theDoneFlag = true
        } else {
            self.theDoneFlag = false

        }
        super.init()
    }
    
    func encode(with coder: NSCoder) {
            // do not call super in this case
        coder.encode(self.theContent, forKey: "theContent")
        coder.encode(self.theCategory, forKey: "theCategory")
        coder.encode(self.theDate, forKey: "theDate")
        coder.encode(self.theDoneFlag, forKey: "theDoneFlag")
    }
    
    required init(coder: NSCoder) {
        self.theContent = coder.decodeObject(
            of: NSString.self, forKey:"theContent")! as String
        self.theCategory = coder.decodeObject(
                of: NSString.self, forKey:"theCategory")! as String
        self.theDate = coder.decodeObject(
            of: NSDate.self, forKey:"theDate")! as Date
        self.theDoneFlag = coder.decodeObject(
            of: NSValue.self, forKey:"theDoneFlag")! as! Bool
            // do not call super init(coder:) in this case
            super.init()
    }
}

