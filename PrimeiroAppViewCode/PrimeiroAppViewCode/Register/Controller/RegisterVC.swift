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
    func backPage() {
        let back = LoginVC()
        self.navigationController?.pushViewController(back, animated: true)
        print("Volar a pagina login")
    }
    
    func actionRegisterButton() {
        print("Botao selecionado")
    }

}
extension RegisterVC: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing")
    }
    
}

/*



*/
