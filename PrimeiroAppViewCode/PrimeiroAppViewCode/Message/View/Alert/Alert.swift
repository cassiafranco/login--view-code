//
//  Alert.swift
//  PrimeiroAppViewCode
//
//  Created by cassia franco on 24/03/22.
//
import UIKit
import Foundation

class Alert {
    
    var controller: UIAlertController
    
    init(controller: UIAlertController) {
        self.controller = controller
    }
    func getAlert(title:String = "Atenção", message:String, completion:(() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "OK", style: .cancel) { (acao) in
            completion?()
        }
        alert.addAction(cancel)
        self.controller.present(alert, animated: true, completion: nil)
    }
    func addContact(completion:((_ value: String) -> Void)? = nil) {
        var _textField: UITextField?
        let alert = UIAlertController(title: "Adicionar Usuário", message: "Digite um email valido", preferredStyle: .alert)
        let add = UIAlertAction(title: "Adicionar", style: .default) { (acao) in
            completion?(_textField?.text ?? "")
        }
        let cancel = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alert.addAction(cancel)
        alert.addAction(add)
        alert.addTextField(configurationHandler: {(textField: UITextField) in
            _textField = textField
            textField.placeholder = "Email"
        })
        self.controller.present(alert, animated: true, completion: nil)
    }
}
