//
//  ViewController.swift
//  DepressionApp
//
//  Created by Matthew Dee on 08/03/2016.
//  Copyright © 2016 Matthew Dee. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    let myRootRef = Firebase(url:"https://depression1.firebaseio.com")
    var gender = ""
    
    @IBOutlet weak var usernameTextField: UITextField!
  

    @IBOutlet weak var emailTextField: UITextField!

    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func submit(sender: AnyObject) {
        newUser()
    }
    
    @IBAction func genderMale(sender: AnyObject) {
        gender = "Male"
    }
    
    @IBAction func genderFemale(sender: AnyObject) {
        gender = "Female"
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }

    func writeData() {
        
        let usersRef = myRootRef.childByAppendingPath("users")
        let update = usersRef.childByAppendingPath(usernameTextField.text)
        let newUserData = ["username": usernameTextField.text! as String, "gender": gender as String ]

        
        
        update.updateChildValues(newUserData)
    }
    
    func readData() {
        
        // Read data and reacts to changes
        myRootRef.observeEventType(.Value, withBlock: {
            snapshot in
            print("\(snapshot.key) -> \(snapshot.value)")
        })
    
}
    
    func newUser() {
        
        myRootRef.createUser(emailTextField.text, password: passwordTextField.text,            withValueCompletionBlock: { error, result in
                
                if error != nil {
                    print("There was an error creating the account")
                } else {
                    let uid = result["uid"] as? String
                    print("Successfully created user account with uid: \(uid)")
                }
                
                self.writeData()
        })
        
    }
    
}