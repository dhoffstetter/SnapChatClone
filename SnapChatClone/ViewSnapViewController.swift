//
//  ViewSnapViewController.swift
//  SnapChatClone
//
//  Created by Diane Hoffstetter on 9/17/16.
//  Copyright © 2016 Dumb Blonde Software. All rights reserved.
//

import UIKit
import SDWebImage
import Firebase
import FirebaseDatabase
import FirebaseAuth
import FirebaseStorage

class ViewSnapViewController: UIViewController {

  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var label: UILabel!
  
  var snap = Snap()
  
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      
      label.text = snap.descrip
      
      imageView.sd_setImage(with: URL(string: snap.imageURL))

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  override func viewWillDisappear(_ animated: Bool) {
  
    FIRDatabase.database().reference().child("users").child(FIRAuth.auth()!.currentUser!.uid).child("snaps").child(snap.key).removeValue()
    
      FIRStorage.storage().reference().child("images").child("\(snap.uuid).jpg").delete { (error) in
        print("Delete")
    }
    
  }
  

}
