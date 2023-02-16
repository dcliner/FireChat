//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBAction func registerPressed(_ sender: UIButton) {
        guard let email = emailTextfield.text else {return}
        guard let password = passwordTextfield.text else {return}
        Auth.auth().createUser(withEmail: email, password: password) { [self] authResult, error in
            if let er = error{
                let errordesc = er.localizedDescription
                print(errordesc)
                func showAlert(){
                    let alert = UIAlertController.init(title: "Invalid Registration", message: "\(errordesc)", preferredStyle: UIAlertController.Style.alert)
                    let alertAction = UIAlertAction.init(title: "OK", style: .default){
                        _ in
                        alert.dismiss(animated: true, completion: nil)
                    }
                    alert.addAction(alertAction)
                    self.present(alert, animated: true)
                }
                showAlert()
            }else {
                    self.performSegue(withIdentifier: "RegisterToChat", sender: self)
                self.emailTextfield.text = ""
                self.passwordTextfield.text = ""
                }
        }
    }
    
}
