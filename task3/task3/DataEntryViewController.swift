//
//  DataEntryViewController.swift
//  task3
//
//  Created by Apps Team Mac book Air on 09/09/21.
//

import UIKit

class DataEntryViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var NameField: UITextField!
    @IBOutlet var AddressField: UITextView!
    @IBOutlet var NumberField: UITextField!
    @IBOutlet var RoleField: UITextField!


    public var completion:((String,String,String,String,Bool)-> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NameField.becomeFirstResponder()
        NumberField.delegate = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didtapSave))
        
    }
    
    @objc func didtapSave()
    {
        if let text = NameField.text, !text.isEmpty, !AddressField.text!.isEmpty,!NumberField.text!.isEmpty,!RoleField.text!.isEmpty{
            completion?(NameField.text!,AddressField.text,NumberField.text!,RoleField.text!, true )
        }
    }
    

   

}
