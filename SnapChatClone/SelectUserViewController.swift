//
//  SelectUserViewController.swift
//  SnapChatClone
//
//  Created by Diane Hoffstetter on 9/15/16.
//  Copyright © 2016 Dumb Blonde Software. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseStorage
import FirebaseAuth

class SelectUserViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

  @IBOutlet weak var tableView: UITableView!
  
  var users : [User] = []
  var imageURL = ""
  var descrip = ""
  var uuid = ""
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      
      self.tableView.delegate = self
      self.tableView.dataSource = self
      
      FIRDatabase.database().reference().child("users").observe(FIRDataEventType.childAdded, with: {(snapshot) in
      
        print("Hey")
        print(snapshot)
        
        let user = User()
        user.email = (snapshot.value! as AnyObject)["email"] as! String
        user.uid = snapshot.key
        
        self.users.append(user)
        self.tableView.reloadData()
      })
      
    }
  
  override func viewWillAppear(_ animated: Bool) {

    self.navigationItem.setHidesBackButton(true, animated:false);
  }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return users.count
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    let user = self.users[indexPath.row]
    
    let snap = ["from":FIRAuth.auth()!.currentUser!.email!,"description":self.descrip,"imageURL":self.imageURL, "uuid":self.uuid]
    
    FIRDatabase.database().reference().child("users").child(user.uid).child("snaps").childByAutoId().setValue(snap)
    
    self.navigationController!.popToRootViewController(animated: true)
    }
  
  
//  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//    
//    print("didSelectRowAt")
//    
//    var snapFrom = ""
//    let userID = FIRAuth.auth()?.currentUser?.uid
//    FIRDatabase.database().reference().child("users").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
//      // Get user value
//      snapFrom = (snapshot.value! as AnyObject)["email"] as! String
//      
//      print (snapFrom)
//      
//      let user = self.users[indexPath.row]
//      
//      let snap = ["from":snapFrom,"description":self.descrip,"imageURL":self.imageURL, "uuid":self.uuid]
//      //    let snap = ["from":user.email,"description":descrip,"imageURL":imageURL, "uuid":uuid]
//      
//      FIRDatabase.database().reference().child("users").child(user.uid).child("snaps").childByAutoId().setValue(snap)
//      
//      self.navigationController!.popToRootViewController(animated: true)
//      
//      // ...
//    }) { (error) in
//      print(error.localizedDescription)
//      self.navigationController!.popToRootViewController(animated: true)
//      
//    }
//    
//  }
//  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = UITableViewCell()
    let user = users[indexPath.row]
    cell.textLabel?.text = user.email
    
    return cell
  }


}
