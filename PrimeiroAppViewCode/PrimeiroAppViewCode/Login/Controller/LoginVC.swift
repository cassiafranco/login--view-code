//
//  ViewController.swift
//  PrimeiroAppViewCode
//
//  Created by cassia franco on 16/10/21.
//

import UIKit

class LoginVC: UIViewController {
    
    var loginScren: LoginScreen?
    
    override func loadView() {
        self.loginScren = LoginScreen()
        self.loginScren?.delegate(delegate: self)
        self.loginScren?.configTextFieldDelegate(delegate: self)
        self.view = self.loginScren
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
}
extension LoginVC: LoginScreenProtocol{
    func actionLoginButton() {
        print("Pressionei o Login")
    }
    
    func actionRegisterButton() {
        print("Ir para a pagina Register")
        let register = RegisterVC()
        self.navigationController?.pushViewController(register, animated: true)
    }
    
}
extension LoginVC: UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing")
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("textFieldDidEndEditing")
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textFieldShouldReturn")
        textField.resignFirstResponder()
        
        return true
    }
}

