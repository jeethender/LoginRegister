//
//  RegisterVC.swift
//  LoginRegister
//
//  Created by maisapride8 on 15/06/16.
//  Copyright © 2016 maisapride8. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController,UITextFieldDelegate
{
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController!.setNavigationBarHidden(true, animated: true)
        //Handle the textfileds user input through delegates callback.
        userNameTextField.delegate = self
        passwordTextField.delegate = self
        confirmPasswordTextField.delegate = self
        
    }
    
    //MARK: TextField delegates.
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        //Hide Keyboard
        textField.resignFirstResponder()
        return true
    }
    
    //MARK: Helper methods
    @IBAction func registerButtonTapped(sender: UIButton)
    {
        let checkboxStatus = ischeckedGlobal
        print("regis btn \(checkboxStatus)")
        
        self.resignFirstResponder()
        let username = userNameTextField.text
        let password = passwordTextField.text
        let confirmPassword = confirmPasswordTextField.text
        if username!.isEmpty && password!.isEmpty && confirmPassword!.isEmpty {
            print(" Please enter all fields")
            displayAlertMessage(" Please enter all fields")
            return
        }else if username!.isEmpty {
            print(" Please enter email")
            displayAlertMessage("Please enter email")
            return
            
        }else if password!.isEmpty {
            print("Please enter password")
            displayAlertMessage("Please enter password")
            return
            
        }else if username!.characters.count < 4  {
            displayAlertMessage("username should be atleast 4 characters long")
            return
            
        }else if password!.characters.count < 4 {
            print("Password should be atleast 4 characters long")
            displayAlertMessage("Password should be atleast 4 characters long")
            return
            
        }else if password != confirmPassword{
            print(" Passwords didn't match")
            displayAlertMessage("password Didn't match")
            return
            
        } else if (!validateEmailWithString(username!)){
            displayAlertMessage("Please privide a valid email address")
            return
        }else if (checkboxStatus == false ) {
            print("checkboxStatus == false")
            displayAlertMessage("Please select the checkBox")
            return
        }
        
        // If all fields are alright save the values
        NSUserDefaults.standardUserDefaults().setObject(username, forKey: "username")
        NSUserDefaults.standardUserDefaults().setObject(password, forKey: "password")
        NSUserDefaults.standardUserDefaults().setBool(checkboxStatus, forKey: "isChecked")
        NSUserDefaults.standardUserDefaults().synchronize()
        print(" Registration successful")
        
        let myAlert = UIAlertController(title: "Successfull", message: "Registration Successfull", preferredStyle: .Alert)
        
        let okAction = UIAlertAction(title: "ok", style: .Default) { (UIAlertAction) in
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        myAlert.addAction(okAction)
        self.presentViewController(myAlert, animated: true, completion: nil)
    }
    
    //Validate Email
    private func validateEmailWithString(email: NSString) -> Bool
    {
        let emailRegex: NSString = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        let emailTest: NSPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        
        return emailTest.evaluateWithObject(email)
    }
    
    //Display Registration alert message.
    private func displayAlertMessage(userMessage: String)
    {
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: .Alert)
        let okAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        myAlert.addAction(okAction)
        self.presentViewController(myAlert, animated: true, completion: nil)
    }
    @IBAction func DismissKeyboard(sender: UITapGestureRecognizer)
    {
        self.view.endEditing(true)
    }
    
    @IBAction func gotoLoginPage(sender: UIButton)
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func closeSignUpPage(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    //MARK: Check Box selection
    
    /* @IBOutlet weak var checkBox: UIButton!
     let checkedImage = UIImage(named: "check_box")
     let unCheckedImage = UIImage(named: "checkbox_unchecked")
     var ischecked: Bool = false {
     didSet{
     if ischecked == true {
     checkBox.setImage(checkedImage, forState: UIControlState.Selected)
     print("ischecked true")
     }else{
     checkBox.setImage(unCheckedImage, forState: UIControlState.Normal)
     print("ischecked false")
     }
     }
     }
     @IBAction func CheckBoxButtonTapped(sender: UIButton)
     {
     print("CheckBoxButtonTapped")
     ischecked = !ischecked
     }
     override func awakeFromNib(){
     checkBox.addTarget(self, action: #selector(CheckBoxButtonTapped(_:)), forControlEvents: UIControlEvents.TouchUpInside)
     // self.isChecked = false
     }*/
}


