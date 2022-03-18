//
//  LoginScreen.swift
//  PrimeiroAppViewCode
//
//  Created by cassia franco on 16/10/21.
//

import UIKit
import SnapKit

class LoginScreen: UIView {
    
    weak var delegate: LoginScreenProtocol?
    
    func delegate(delegate: LoginScreenProtocol?) {
        self.delegate = delegate
    }
    
    
    //MARK: - Create elements
    lazy var logoAppImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "logo")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    lazy var textFieldPassword: UITextField = {
        let view = UITextField()
        view.placeholder = "Password"
        view.keyboardType = .default
        view.backgroundColor = .white
        view.borderStyle = .roundedRect
        view.autocorrectionType = .no
        view.font = UIFont.systemFont(ofSize: 14)
        view.textColor = .darkGray
        view.isSecureTextEntry = true
        view.textAlignment = .center
        return view
    }()
    
    lazy var textFieldEmail: UITextField = {
        let view = UITextField()
        view.placeholder = "E-mail Address"
        view.keyboardType = .emailAddress
        view.borderStyle = .roundedRect
        view.backgroundColor = .white
        view.autocorrectionType = .no
        view.font = UIFont.systemFont(ofSize: 14)
        view.textColor = .darkGray
        view.textAlignment = .center
        return view
    }()
    
    lazy var loginButton: UIButton = {
        let view = UIButton()
        view.setTitle("Sign in", for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        view.setTitleColor(.white, for: .normal)
        view.clipsToBounds = true
        view.layer.cornerRadius = 7.5
        view.backgroundColor = UIColor(red: 3/255, green: 58/255, blue: 51/255, alpha: 1.0)
        view.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)
        return view
    }()
    
    lazy var registerButton: UIButton = {
        let view = UIButton()
        view.setTitle("Não tem conta? Cadastrar-se", for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        view.setTitleColor(.white, for: .normal)
        view.addTarget(self, action: #selector(self.tappedRegisterButton), for: .touchUpInside)
        return view
    }()
    
    //MARK: - Methods Text Fiel isEmpty -
    public func emailIsEmpty() {
        if self.textFieldEmail.text == "" {
            self.textFieldEmail.layer.borderColor = UIColor.red.cgColor
        }else {
            self.textFieldEmail.layer.borderColor = UIColor.lightText.cgColor
            self.textFieldEmail.borderStyle = .roundedRect
        }
    }
    public func passwordIsEmpty() {
        if self.textFieldPassword.text == "" {
            self.textFieldPassword.layer.borderColor = UIColor.red.cgColor
        }else {
            self.textFieldPassword.layer.borderColor = UIColor.lightText.cgColor
            self.textFieldPassword.borderStyle = .roundedRect
        }
    }
    //MARK: - Actions get Text
    public func getEmail() -> String {
        return self.textFieldEmail.text ?? ""
    }
    public func getPassword() -> String {
        return self.textFieldPassword.text ?? ""
    }
    
    
    
    //MARK: - Super View Construction
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.greenBackground()
        self.setUpSubViews()
        
        //------------------##--------------------
        self.configlogoAppImageViewConstraints()
        self.configTextFieldEmailConstraints()
        self.configTextFieldPasswordConstraints()
        self.configLoginButtonConstraints()
        self.configRegisterButtonConstraints()
        //------------------##--------------------
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setUpSubViews(){
        self.addSubview(self.logoAppImageView)
        self.addSubview(self.textFieldPassword)
        self.addSubview(self.textFieldEmail)
        self.addSubview(self.loginButton)
        self.addSubview(self.registerButton)
    }
    //MARK: Action of Buttons
    @objc private func tappedLoginButton(){
        self.delegate?.actionLoginButton()
        
    }
    @objc private func tappedRegisterButton(){
        self.delegate?.actionRegisterButton()
    }
    //MARK: - Config Delegate TexFields
    public func configTextFieldDelegate(delegate:UITextFieldDelegate){
        self.textFieldEmail.delegate = delegate
        self.textFieldPassword.delegate = delegate
        
    }
    //MARK: - SnapKit
    //inset = valor negativo
    //offset = valor positivo
    
    func configlogoAppImageViewConstraints() {
        self.logoAppImageView.snp.makeConstraints{ (make) in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(150)
        }
    }

    
    func configTextFieldEmailConstraints() {
        self.textFieldEmail.snp.makeConstraints{ (make) in
            make.top.equalTo(self.logoAppImageView.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(45)
        }
    }
    func configTextFieldPasswordConstraints() {
        self.textFieldPassword.snp.makeConstraints{ (make) in
            make.top.equalTo(self.textFieldEmail.snp.bottom).offset(15)
            make.leading.equalTo(self.textFieldEmail.snp.leading)
            make.trailing.equalTo(self.textFieldEmail.snp.trailing)
            make.height.equalTo(self.textFieldEmail.snp.height)
            
        }
    }
    func configLoginButtonConstraints() {
        self.loginButton.snp.makeConstraints{ (make) in
            make.top.equalTo(self.textFieldPassword.snp.bottom).offset(15)
            make.leading.equalTo(self.textFieldPassword.snp.leading)
            make.trailing.equalTo(self.textFieldPassword.snp.trailing)
            make.height.equalTo(self.textFieldPassword.snp.height)
        }
    }
    func configRegisterButtonConstraints() {
        self.registerButton.snp.makeConstraints{ (make) in
            make.top.equalTo(self.loginButton.snp.bottom).offset(15)
            make.leading.equalTo(self.loginButton.snp.leading)
            make.trailing.equalTo(self.loginButton.snp.trailing)
            make.height.equalTo(self.loginButton.snp.height)
            
        }
    }
    
    
    //MARK: - Method SetupConstraints
    
    // equalTo
    // basear em um determinado elemento.
    
    // constant:
    // me afastar/aproximar do elemento referente(equalTo)
    
    //equalToConstant:
    // setando um valor fixo para o determinado elemento.
    
    private func setUpConstraints() {

        let constant: CGFloat = 15

        NSLayoutConstraint.activate([


//            //MARK: - Constraints ImageView
//            self.logoAppImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: CGFloat(20)),
//            self.logoAppImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: CGFloat(60)),
//            self.logoAppImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: CGFloat(-60)),
//            self.logoAppImageView.heightAnchor.constraint(equalToConstant: CGFloat(150)),

            // MARK: - Constraints Label
//                        self.loginLabel.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor, constant: CGFloat(-100)),
//                        self.loginLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: CGFloat(10)),
//                        self.loginLabel.trailingAnchor.constraint(equalTo: self.loginTextField.leadingAnchor, constant: CGFloat(-10)),
//                        self.loginLabel.heightAnchor.constraint(equalToConstant: CGFloat(40)),

            //MARK: Constraints Text Field Email
            self.textFieldEmail.topAnchor.constraint(equalTo: self.logoAppImageView.bottomAnchor, constant: constant),
            self.textFieldEmail.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: CGFloat(30)),
            self.textFieldEmail.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: CGFloat(-30)),
            self.textFieldEmail.heightAnchor.constraint(equalToConstant: CGFloat(45)),

            //MARK: Constraints Text Field Email
            self.textFieldPassword.topAnchor.constraint(equalTo: self.textFieldEmail.bottomAnchor, constant: constant),
            self.textFieldPassword.leadingAnchor.constraint(equalTo: self.textFieldEmail.leadingAnchor),
            self.textFieldPassword.trailingAnchor.constraint(equalTo: self.textFieldEmail.trailingAnchor),
            self.textFieldPassword.heightAnchor.constraint(equalTo: self.textFieldEmail.heightAnchor),

            //MARK: Contraints Button
            self.loginButton.topAnchor.constraint(equalTo: self.textFieldPassword.bottomAnchor, constant: constant),
            self.loginButton.leadingAnchor.constraint(equalTo: self.textFieldPassword.leadingAnchor),
            self.loginButton.trailingAnchor.constraint(equalTo: self.textFieldPassword.trailingAnchor),
            self.loginButton.heightAnchor.constraint(equalTo: self.textFieldPassword.heightAnchor),

            //MARK: Constraints Button Register
            self.registerButton.topAnchor.constraint(equalTo: self.loginButton.bottomAnchor, constant: constant),
            self.registerButton.leadingAnchor.constraint(equalTo: self.loginButton.leadingAnchor),
            self.registerButton.trailingAnchor.constraint(equalTo: self.loginButton.trailingAnchor),
            self.registerButton.heightAnchor.constraint(equalTo: self.loginButton.heightAnchor),

        ])
    }
}
