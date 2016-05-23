//
//  VCNewRequest.swift
//  HZTB
//
//  Created by Pivotal on 5/23/16.
//  Copyright © 2016 pivotaldesign.biz. All rights reserved.
//

import UIKit
import ContactsUI

class VCNewRequest: UIViewController, CNContactPickerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        //
    }
    
    @IBAction func onViewContacts(sender: AnyObject){
        showNativeContactsUI()
    }
    
    // displaying Native Contacts UI
    private func showNativeContactsUI(){
        let contactPickerViewController = CNContactPickerViewController()
        
        // Filter the contacts
        //contactPickerViewController.predicateForEnablingContact = NSPredicate(format: "birthday != nil")
        
        contactPickerViewController.delegate = self
        
        // Display only what you need
        //contactPickerViewController.displayedPropertyKeys = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactEmailAddressesKey, CNContactBirthdayKey, CNContactImageDataKey]
        
        // Finally present the UI
        presentViewController(contactPickerViewController, animated: true, completion: nil)
    }
    
    
    // Delegate Methods
    /*
     // single selection
     func contactPicker(picker: CNContactPickerViewController, didSelectContact contact: CNContact) {
     print("contactPicker : didSelectContact")
     //delegate.didFetchContacts([contact])
     print(contact)
     }*/
    
    // multi select
    func contactPicker(picker: CNContactPickerViewController, didSelectContacts contacts: [CNContact]){
        print("contactPicker : didSelectContacts")
        print(contacts)
    }
}
