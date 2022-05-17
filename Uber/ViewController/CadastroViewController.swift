//
//  CadastroViewController.swift
//  Uber
//
//  Created by Vitor Henrique Barreiro Marinho on 17/05/22.
//

import UIKit
import FirebaseAuth


class CadastroViewController: UIViewController {
    
    @IBOutlet weak var email:UITextField!
    
    @IBOutlet weak var fullName:UITextField!
    
    @IBOutlet weak var userPassword:UITextField!
    
    @IBOutlet weak var registerNewUserButton: UIButton!
    
    @IBOutlet weak var userType:UISwitch!
    
    let authentication = Auth.auth()
    
    @IBAction func registerNewUserButton (sender: Any) {
        
        if let email = email.text, let fullname = fullName.text , let userPassword = userPassword.text {
            
            authentication.createUser(withEmail: email, password: userPassword) { result, error in
                
                if error == nil {
                 print ("User registered successfullly")
                } else {
                    
                    print ("It was not possible to create the user")
                }
                
                
                if result != nil {
                    
                self.performSegue(withIdentifier: "goToHomeAfterRegister", sender: self)
                }
            }

        }
        

    }
    
    
    
    
    
    
    override func viewDidLoad() {
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    func configureUI () {
        
        registerNewUserButton.layer.cornerRadius = 5
     
        registerNewUserButton.layer.masksToBounds = true
      

    }
    
    
}
