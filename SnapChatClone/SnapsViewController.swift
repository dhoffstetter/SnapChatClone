//
//  SnapsViewController.swift
//  SnapChatClone
//
//  Created by Diane Hoffstetter on 9/14/16.
//  Copyright © 2016 Dumb Blonde Software. All rights reserved.
//

import UIKit

class SnapsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  @IBAction func logoutTapped(_ sender: AnyObject) {
    
    dismiss(animated: true, completion: nil)
  }



}
