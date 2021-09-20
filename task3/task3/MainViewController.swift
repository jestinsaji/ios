//
//  ViewController.swift
//  task3
//
//  Created by Apps Team Mac book Air on 09/09/21.
//

import UIKit

class MainViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
   
    @IBOutlet var table : UITableView!
    @IBOutlet var label : UILabel!
    //switch
    @IBOutlet var mySwitch: UISwitch!
    
    
    var models: [(Name: String, Address: String, Number: String, Role: String, switchOnIndex: Bool)] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.delegate = self
        table.dataSource = self
    }

    @IBAction func AddNew(){
        guard let vc = storyboard?.instantiateViewController(identifier: "newentry") as? DataEntryViewController else
            {
                return
            }
        vc.title = "New Contact"
        vc.completion = { Name,Address,Number,Role,switchOnIndex in
            self.navigationController?.popToRootViewController(animated: true)
            self.models.append((Name: Name, Address: Address, Number: Number, Role: Role, switchOnIndex:true))
            self.mySwitch.isHidden = true
            self.label.isHidden = true
            self.table.isHidden = false
            self.table.reloadData()
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = models[indexPath.row].Address
        cell.textLabel?.text = models[indexPath.row].Number
        cell.textLabel?.text = models[indexPath.row].Role
        cell.textLabel?.text = models[indexPath.row].Name
        
        //switch
        
        let mySwitch = UISwitch(frame: .zero)
        mySwitch.setOn(true, animated: true)
        mySwitch.tag = indexPath.row
        mySwitch.onTintColor = UIColor.red
        mySwitch.thumbTintColor = UIColor.green
        mySwitch.addTarget(self, action: #selector (switchValueDidChange), for: .valueChanged)
        cell.accessoryView = mySwitch

        return cell
    }
    
    
    @objc func switchValueDidChange(_sender: UISwitch){
        if _sender .isOn{
            models[_sender.tag].switchOnIndex = true
            view.backgroundColor = UIColor.red
        }
        else{
            models[_sender.tag].switchOnIndex = false
            view.backgroundColor = UIColor.systemPurple
        }
    }

   
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    
        let model = models[indexPath.row]
        
        // DataDisplayViewController
        let vc = storyboard?.instantiateViewController(identifier: "details")as! DataDisplayViewController
        vc.Name = model.Name
        vc.Address = model.Address
        vc.NumberField = model.Number
        vc.RoleField = model.Role
        vc.isSwitchSelected = model.switchOnIndex
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
   
    
}

