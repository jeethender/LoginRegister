//
//  LoginVC.swift
//  LoginRegister
//
//  Created by maisapride8 on 15/06/16.
//  Copyright © 2016 maisapride8. All rights reserved.
//

import UIKit

class LoginVC: UIViewController,UITextFieldDelegate
{
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
      userNameTextField.isFirstResponder()
        passwordTextField.isFirstResponder()
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func loginButtonTapped(sender: UIButton)
    {
        userNameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        
        let username = userNameTextField.text
        let password = passwordTextField.text
        
        let usernameStored = NSUserDefaults.standardUserDefaults().stringForKey("username")
        let passwordStored =  NSUserDefaults.standardUserDefaults().stringForKey("password")
        NSUserDefaults.standardUserDefaults().synchronize()
        
       
        if username!.isEmpty || password!.isEmpty{
            print(" Please enter username and password.")
            displayAlertMessage(" Please enter username and password.")
            return
        }else if username == usernameStored && password == passwordStored {
            
            print("Login Successful")
            //displayAlertMessage("Login Successful")
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "isUserLoggedIn")
            NSUserDefaults.standardUserDefaults().stringForKey("username")
            NSUserDefaults.standardUserDefaults().synchronize()
            
            self.dismissViewControllerAnimated(true, completion: nil)
            
        } else {
            
            print("Wrong credentials")
            displayAlertMessage("Wrong credentials")
            return
        }
    }
    
    private func displayAlertMessage(userMessage: String)
    {
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: .Alert)
        let okAction = UIAlertAction(title: "ok", style: .Default, handler: nil)
        
        myAlert.addAction(okAction)
        self.presentViewController(myAlert, animated: true, completion: nil)
        
    }
    
    @IBAction func DismissKeyboard(sender: UITapGestureRecognizer)
    {
        self.view.endEditing(true)
    }
}
