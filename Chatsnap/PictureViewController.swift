//
//  PictureViewController.swift
//  Chatsnap
//
//  Created by Christopher Feltner on 4/1/17.
//  Copyright © 2017 Christopher Feltner. All rights reserved.
//

import UIKit

class PictureViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onCameraPressed(_ sender: Any) {
    }

    @IBAction func onNextPressed(_ sender: Any) {
    }
}
