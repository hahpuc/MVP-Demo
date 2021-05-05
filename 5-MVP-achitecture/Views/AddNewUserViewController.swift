//
//  AddNewUserViewController.swift
//  5-MVP-achitecture
//
//  Created by Long Nguyễn on 05/05/2021.
//

import UIKit

class AddNewUserViewController: UIViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var addUserButton: ButtonDesignable!
    
    let present = AddNewPresenter()
    var userVC = UserViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
//        validateTextField()
        
        self.dismissKey()
    }
    
    func validateTextField() {
        firstNameTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        lastNameTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    @objc func textFieldDidChange() {
        if (firstNameTextField.text == "" || lastNameTextField.text == "") {
            addUserButton.isEnabled = false
        } else {
            addUserButton.isEnabled = true
        }
    }
    

    @IBAction func handleAddUser(_ sender: Any) {
        print("Handle add new user")
        present.addNewUser(firstName: firstNameTextField.text!, lastName: lastNameTextField.text!)
        
        userVC.presenter.getUsers()
        self.dismiss(animated: true)
    }
}

