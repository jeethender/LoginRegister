//
//  CheckboxButton.swift
//  checkboxButton
//
//  Created by maisapride8 on 20/06/16.
//  Copyright © 2016 maisapride8. All rights reserved.
//

import UIKit

var ischeckedGlobal = Bool()
class CheckboxButton: UIButton
{
    let checkedImage = UIImage(named: "check_box")
    let unCheckedImage = UIImage(named: "checkbox_unchecked")

     var isChecked: Bool = false {
        didSet{
            if isChecked == true {
               self.setImage(checkedImage, forState: .Normal)
                //print("checkboxButton isChecked True")
            } else {
                self.setImage(unCheckedImage, forState: .Normal)
                //print("checkboxButton isChecked false")
            }
        }
        
    }
    
    func checkboxButtonTapped(sender: UIButton){
        
        //print("before btn tap change\(isChecked)")
        if sender == self {
        if isChecked == true{
            isChecked = false
             ischeckedGlobal = false
        }else{
            isChecked = true
            ischeckedGlobal = true
            }
        }
        //print("after btntap change\(isChecked)")
        
          }
   override func awakeFromNib(){
        self.addTarget(self, action: #selector(checkboxButtonTapped(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.isChecked = false
    }
}
