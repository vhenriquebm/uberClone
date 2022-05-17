//
//  ViewController.swift
//  Uber
//
//  Created by Vitor Henrique Barreiro Marinho on 17/05/22.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    
    let authentication = Auth.auth()
    
    
    @IBOutlet weak var entrarButton: UIButton!
    
    @IBOutlet weak var registerButton: UIButton!
    
    @IBAction func entrarButton(_ sender: Any) {
        
        performSegue(withIdentifier: "login", sender: self)
        
    }
    
    
    @IBAction func registerButton(_ sender: Any) {
        
        performSegue(withIdentifier: "cadastro", sender: self)
        
    }
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        authentication.addStateDidChangeListener { autenticacao, usuario in
          
            if let usuario = usuario {
                
                self.performSegue(withIdentifier: "userIsLogged", sender: self)
            }
        }
        
configureUI()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }


    func configureUI () {
        
        entrarButton.layer.cornerRadius = 5
        registerButton.layer.cornerRadius = 5
        entrarButton.layer.masksToBounds = true
        registerButton.layer.masksToBounds = true

    }
    
    
}

