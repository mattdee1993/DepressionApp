//
//  LoginViewController.swift
//  DepressionApp
//
//  Created by Matthew Dee on 09/03/2016.
//  Copyright © 2016 Matthew Dee. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!

    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func loginButton(sender: AnyObject) {
        Login()
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
   
    func Login(){
        let ref = Firebase(url: "https://depression1.firebaseio.com")
        ref.authUser("copson@copson.com", password: "qwerty",
            withCompletionBlock: { error, authData in
                if error != nil {
                    print("There was an error logging in to this account")
                } else {
                    print ("We are now logged in")
                    self.performSegueWithIdentifier("LoginToQuestion", sender: self)
                    }
        })
    }


}