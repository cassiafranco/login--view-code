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
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}

