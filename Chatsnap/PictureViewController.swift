//
//  PictureViewController.swift
//  Chatsnap
//
//  Created by Christopher Feltner on 4/1/17.
//  Copyright © 2017 Christopher Feltner. All rights reserved.
//

import UIKit
import Firebase

class PictureViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    var imagePicker = UIImagePickerController()
    var image = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        nextButton.isEnabled = false
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        imageView.image = image
        imageView.backgroundColor = UIColor.clear
        dismiss(animated: true, completion: nil)
        if(imageView.image != nil)
        {
            nextButton.isEnabled = true
        }
    }
    
    @IBAction func onCameraPressed(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = false
        present(imagePicker, animated: true, completion: nil)
        
    }

    @IBAction func onNextPressed(_ sender: Any) {
        nextButton.isEnabled = false
        let imagesFolder = FIRStorage.storage().reference().child("Images")
        let imageData = UIImageJPEGRepresentation(imageView.image!, 0.1)
        
        imagesFolder.child("\(NSUUID().uuidString).jpeg").put(imageData!, metadata: nil) { (metadata, error) in
            print("Upload attempted")
            if error != nil{
                print("An error occured.")
            }
            else{
                print(metadata?.downloadURL())
                self.performSegue(withIdentifier: "selectUserSegue", sender: nil)
            }
        }

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }
}
