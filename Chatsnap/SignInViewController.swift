//
//  SignInViewController.swift
//  Chatsnap
//
//  Created by Christopher Feltner on 3/26/17.
//  Copyright © 2017 Christopher Feltner. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignInViewController: UIViewController {
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FIRDatabase.database().reference().child("hello").setValue("uploaded")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func onTurnUp(_ sender: Any) {
        FIRAuth.auth()?.signIn(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: { (user, error) in
            print("Sign in attempt.")
            if error != nil
            {
                print("error occured \(error!)")
                FIRAuth.auth()?.createUser(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!, completion: { (user, error) in
                    print("We tried to create a user")
                    if error != nil
                    {
                        print("we have an error \(error!)")
                    }
                    else
                    {
                        print("user created")
     
                        self.performSegue(withIdentifier: "signInSegue", sender: nil)
                    }
                })
            }
            else{
                print("signed in successfully")
                self.performSegue(withIdentifier: "signInSegue", sender: nil)
            }
        })
    }
    
}

