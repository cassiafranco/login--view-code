//
//  RegisterVC.swift
//  PrimeiroAppViewCode
//
//  Created by cassia franco on 18/10/21.
//

import UIKit
import Firebase

class RegisterVC: UIViewController{
    
    var registerScreen: RegisterScreen?
    
    var auth: Auth?
    
    override func loadView() {
        
        self.registerScreen = RegisterScreen()
        self.registerScreen?.delegate(delegate: self)
        self.registerScreen?.configTextFieldDelegate(delegate: self)
        self.view = self.registerScreen
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.auth = Auth.auth()

    }
}
extension RegisterVC: RegisterScreenProtocol{
    func actionBackButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    func actionRegisterButton() {
        guard let register = self.registerScreen else { return }
        
        self.auth?.createUser(withEmail: register.getEmail(), password: register.getPassword() , completion: { (result, error) in
            
            if error != nil{
                print("Error ao cadastro")
            }else {
                print("Cadastro Realizado com Sucesso")
            }
            
        })
    }

}
extension RegisterVC: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
    }
    
}

