//
//  DataDisplayViewController.swift
//  task3
//
//  Created by Apps Team Mac book Air on 09/09/21.
//

import UIKit

class DataDisplayViewController: UIViewController {
    
    @IBOutlet var NameLabel: UILabel!
    @IBOutlet var AddressLabel: UILabel!
    @IBOutlet var phone: UILabel!
    @IBOutlet var roleof: UILabel!
    @IBOutlet var avatar: UIImageView!
    
    public var Name:String = ""
    public var Address: String = ""
    public var NumberField: String = ""
    public var RoleField: String = ""
    
    var isSwitchSelected: Bool = true
   
    override func viewDidLoad() {
        super.viewDidLoad()
        

        avatar.layer.cornerRadius = (avatar?.frame.size.width ?? 0.0) / 2
        avatar.clipsToBounds = true
        avatar.layer.borderColor = UIColor.red.cgColor
        avatar.layer.borderWidth = 2
        avatar.contentMode = .scaleToFill
        
        NameLabel.text = Name
        AddressLabel.text = Address
        phone.text = NumberField
        roleof.text = RoleField
        
     
        if isSwitchSelected == true {
            view.backgroundColor = UIColor.green
        }
        else{
            view.backgroundColor = UIColor.yellow
        }

    }

}
