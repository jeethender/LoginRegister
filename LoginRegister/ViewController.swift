//
//  ViewController.swift
//  LoginRegister
//
//  Created by maisapride8 on 15/06/16.
//  Copyright © 2016 maisapride8. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    
    @IBOutlet weak var userLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(animated: Bool)
    {
        let isUserLoggedIn = NSUserDefaults.standardUserDefaults().boolForKey("isUserLoggedIn")
        let username = NSUserDefaults.standardUserDefaults().stringForKey("username")
        
          userLabel.text = String(" Wellcome  ") + username!
        
        if(!isUserLoggedIn)
        {
            self.performSegueWithIdentifier("GoToLoginSegue", sender: self)
        }
    }
    
    
    @IBAction func logOutButtonTapped(sender: UIButton)
    {
        NSUserDefaults.standardUserDefaults().setBool(false, forKey: "isUserLoggedIn")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        self.performSegueWithIdentifier("GoToLoginSegue", sender: self)
        
    }
    
    
}

