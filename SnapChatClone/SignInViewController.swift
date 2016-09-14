//
//  SignInViewController.swift
//  SnapChatClone
//
//  Created by Diane Hoffstetter on 9/13/16.
//  Copyright © 2016 Dumb Blonde Software. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignInViewController: UIViewController {

  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


  @IBAction func checkInTapped(_ sender: AnyObject) {
    
    FIRAuth.auth()?.signIn(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: { (user, error) in
      print("We tried to sign in.")
      if error != nil {
        print("We have an error : \(error)")
      }
      else {
        print("Signed in successfully!")
      }
    })
  }
  
}

