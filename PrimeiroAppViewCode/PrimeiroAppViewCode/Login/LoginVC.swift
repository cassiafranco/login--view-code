//
//  ViewController.swift
//  PrimeiroAppViewCode
//
//  Created by cassia franco on 16/10/21.
//

import UIKit
import Firebase

class LoginVC: UIViewController {
    
    var loginScren: LoginScreen?
    var auth: Auth?
    
    override func loadView() {
        self.loginScren = LoginScreen()
        self.loginScren?.delegate(delegate: self)
        self.loginScren?.configTextFieldDelegate(delegate: self)
        self.view = self.loginScren
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.auth = Auth.auth()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    func valideTextField() {
        let email : String = self.loginScren?.textFieldEmail.text ?? ""
        let password: String = self.loginScren?.textFieldPassword.text ?? ""
        
        if !email.isEmpty && !password.isEmpty {
            self.loginScren?.loginButton.setTitleColor(.white, for: .normal)
            self.loginScren?.loginButton.isEnabled = true
        }else {
            self.loginScren?.loginButton.isEnabled = false
        }
    }
    
}
extension LoginVC: LoginScreenProtocol{
    func actionLoginButton() {
        
        guard let login = self.loginScren else { return }
        
        self.auth?.signIn(withEmail: login.getEmail(), password: login.getPassword(), completion: { (user, error) in
            
            if error != nil{
                print("Atenção dados incorretos, verifique e tente novamente")
            }else{
                if user == nil{
                    print("Tivemos um problema inesperado, tente novamente mais tarde")
                }else {
                    print("Parabens, usuário logado com sucesso")
                }
            }
        })
        
    }
    
    func actionRegisterButton() {
        let register = RegisterVC()
        self.navigationController?.pushViewController(register, animated: true)
    }
    
}
extension LoginVC: UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.blue.cgColor
        self.loginScren?.loginButton.setTitleColor(.lightGray, for: .normal)
        self.loginScren?.loginButton.isEnabled = true
        
        self.loginScren?.loginButton.setTitleColor(.lightGray, for: .normal)
        self.loginScren?.loginButton.isEnabled = true
        
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        case self.loginScren?.textFieldEmail:
            self.loginScren?.emailIsEmpty()
        case self.loginScren?.textFieldPassword:
            self.loginScren?.passwordIsEmpty()
            self.valideTextField()
        default:
            break
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        self.loginScren?.loginButton.setTitleColor(.white, for: .normal)
        self.loginScren?.loginButton.isEnabled = true
        return true
    }
}

