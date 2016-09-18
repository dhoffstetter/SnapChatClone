//
//  SnapsViewController.swift
//  SnapChatClone
//
//  Created by Diane Hoffstetter on 9/14/16.
//  Copyright © 2016 Dumb Blonde Software. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

class SnapsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
  @IBOutlet weak var tableView: UITableView!
  
  var snaps : [Snap] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      
      tableView.dataSource = self
      tableView.delegate = self
      
      FIRDatabase.database().reference().child("users").child((FIRAuth.auth()?.currentUser?.uid)!).child("snaps").observe(FIRDataEventType.childAdded, with: {(snapshot) in
        
        print(snapshot)
        
        let snap = Snap()
        snap.imageURL = (snapshot.value! as AnyObject)["imageURL"] as! String
        snap.from = (snapshot.value! as AnyObject)["from"] as! String
        snap.descrip = (snapshot.value! as AnyObject)["description"] as! String
        
        self.snaps.append(snap)
        self.tableView.reloadData()
      })

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  @IBAction func logoutTapped(_ sender: AnyObject) {
    
    dismiss(animated: true, completion: nil)
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    let snap = snaps[indexPath.row]
    
    performSegue(withIdentifier: "ViewSnapSegue", sender: snap)

    
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return snaps.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = UITableViewCell()
    let snap = snaps[indexPath.row]
    
    cell.textLabel?.text = snap.from
    
    
    
    return cell
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    if segue.identifier == "ViewSnapSegue" {
     
      let nextVC = segue.destination as! ViewSnapViewController
      nextVC.snap = sender as! Snap

    }
    
  }

}















