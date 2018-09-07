//
//  ViewController.swift
//  TextField
//
//  Created by Citizen on 08.09.2018.
//  Copyright © 2018 Citizen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    let newTextField = UITextField()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTextField()
        newTextField.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(textFieldTextDidChange), name: NSNotification.Name.UITextFieldTextDidChange, object: nil)
        NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardWillShow, object: nil, queue: nil) { (nc) in
            self.view.frame.origin.y = -200
        }
        NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardWillHide, object: nil, queue: nil) { (nc) in
            self.view.frame.origin.y = 0.0
        }
        
    }
    
     func createTextField() {
        newTextField.frame = CGRect(x: 0, y: 0, width: 200, height: 31)
        newTextField.center = self.view.center
        newTextField.borderStyle = .line
        newTextField.contentVerticalAlignment = .center
        newTextField.textAlignment = .center
        newTextField.placeholder = "Input password"
        self.view.addSubview(newTextField)
    }

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("textFieldShouldBeginEditing")
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("startRedact")
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("end editing")
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("did end editing")
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("shouldChangeCharactersIn - \(string)")
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("clear")
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textFieldShouldReturn")
        newTextField.resignFirstResponder()
        return true
    }
    
    
    @objc func textFieldTextDidChange(ncParam: NSNotification) {
        print("UITextFieldTextDidChange - \(ncParam)")
    }
    
}

