//
//  LoginViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    

    @IBAction func loginPressed(_ sender: UIButton) {
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
              guard let strongSelf = self else { return }
                if let e = error {
                    let errordesc = e.localizedDescription
                    print(e.localizedDescription)
                    func showAlert(){
                        let alert = UIAlertController.init(title: "Invalid SignIn", message: "\(errordesc)", preferredStyle: UIAlertController.Style.alert)
                        let alertAction = UIAlertAction.init(title: "OK", style: .default){
                            _ in
                            alert.dismiss(animated: true, completion: nil)
                        }
                        alert.addAction(alertAction)
                        self?.present(alert, animated: true)
                    }
                    showAlert()
                }else{
                    self?.performSegue(withIdentifier:"LoginToChat" , sender:self)
                    self?.emailTextfield.text = ""
                    self?.passwordTextfield.text = ""
                }
            }
        }else{
            
           
            
        }
        
        
    }
    
}
