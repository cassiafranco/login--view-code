//
//  RegisterVC.swift
//  PrimeiroAppViewCode
//
//  Created by cassia franco on 18/10/21.
//

import UIKit

class RegisterVC: UIViewController{
    
    var registerScreen: RegisterScreen?
    
    override func loadView() {
        
        self.registerScreen = RegisterScreen()
        self.registerScreen?.delegate(delegate: self)
        self.registerScreen?.configTextFieldDelegate(delegate: self)
        self.view = self.registerScreen
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
extension RegisterVC: RegisterScreenProtocol{
    func actionBackButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    func actionRegisterButton() {
        self.navigationController?.popViewController(animated: true)
        print("teste")
    }

}
extension RegisterVC: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
    }
    
}

