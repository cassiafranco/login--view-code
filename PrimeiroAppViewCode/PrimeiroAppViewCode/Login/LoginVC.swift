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
        self.navigationController?.setNavigationBarHidden(false, animated: false)
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
        let userDetail = UserDetailVC()
        self.navigationController?.pushViewController(userDetail, animated: true)
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

