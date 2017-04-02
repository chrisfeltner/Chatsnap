//
//  SnapsViewController.swift
//  Chatsnap
//
//  Created by Christopher Feltner on 4/1/17.
//  Copyright © 2017 Christopher Feltner. All rights reserved.
//

import UIKit

class SnapsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    //logout function
    @IBAction func onTurnDown(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
