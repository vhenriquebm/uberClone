//
//  EntrarViewController.swift
//  Uber
//
//  Created by Vitor Henrique Barreiro Marinho on 17/05/22.
//

import UIKit
import FirebaseAuth


class EntrarViewController: UIViewController {
    
    @IBOutlet weak var userEmail:UITextField!
    
    @IBOutlet weak var userPassword:UITextField!
    
    
    
    
    let authentication = Auth.auth()
    
    @IBOutlet weak var login:UIButton!
    
    @IBAction func login (sender: Any) {
        
        if let email = userEmail.text, let password = userPassword.text {
            authentication.signIn(withEmail: email, password: password) { result, erro in
                
                if result == nil {

                    let alert1 = UIAlertController(title: "Atenção", message: "Esse usuário não existe", preferredStyle: .alert)
                    
                    let alertAction1 = UIAlertAction(title: "Ok", style: .default, handler: nil)
                    
                    alert1.addAction(alertAction1)
                    
                    self.present(alert1, animated: true, completion: nil)
                    
                    
                }
                
                
                if email.isEmpty || password.isEmpty {
                        
                        let alert = UIAlertController(title: "Atenção", message: "Por gentileza informar o e-mail e senha", preferredStyle: .alert)
                        
                        let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
                        
                        alert.addAction(alertAction)
                        
                    self.present(alert, animated: true, completion: nil)
                        
            
                    }
                
                
                
                if result != nil {

                    self.performSegue(withIdentifier: "goToHome", sender: self)
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

        login.layer.cornerRadius = 5
        login.layer.masksToBounds = true
        
    }
    
    
}
