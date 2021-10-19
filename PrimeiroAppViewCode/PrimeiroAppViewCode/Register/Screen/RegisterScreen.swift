//
//  RegisterScreen.swift
//  PrimeiroAppViewCode
//
//  Created by cassia franco on 18/10/21.
//

import UIKit

class RegisterScreen: UIView {
    
    weak var delegate: RegisterScreenProtocol?
    
    func delegate(delegate:RegisterScreenProtocol?){
        self.delegate = delegate
    }
    //MARK: - Create elements
    lazy var backButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setImage(UIImage(named: "back"), for: .normal)
        view.addTarget(self, action: #selector(tappedBackButton) , for: .touchUpInside)
        return view
        
    }()
    lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "add")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    lazy var textFielEmail: UITextField = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.placeholder = "Insire seu e-mail"
        view.borderStyle = .roundedRect
        view.autocorrectionType = .no
        view.keyboardType = .emailAddress
        view.font = UIFont.systemFont(ofSize: 14)
        view.textColor = .darkGray
        
        return view
    }()
    lazy var textFielPassword: UITextField = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.placeholder = "Insire uma senha"
        view.borderStyle = .roundedRect
        view.keyboardType = .default
        view.autocorrectionType = .no
        view.font = UIFont.systemFont(ofSize: 14)
        view.textColor = .darkGray
        return view
    }()
    lazy var registerButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 3/255, green: 58/255, blue: 51/255, alpha: 1.0)
        view.setTitle("Register", for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        view.setTitleColor(.white, for: .application)
        view.clipsToBounds = true
        view.layer.cornerRadius = 7.5
        view.addTarget(self, action: #selector(tappedButtonRegister), for: .touchUpInside)
        return view
    }()
    
    //MARK: - Super View Construction
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.getUpSubViews()
        self.customColor()
        self.setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - SubViews
    private func getUpSubViews(){
        self.addSubview(self.backButton)
        self.addSubview(self.imageView)
        self.addSubview(self.textFielEmail)
        self.addSubview(self.textFielPassword)
        self.addSubview(self.registerButton)
        
    }
    //MARK: - Method SetupColor
    private func customColor(){
        // .greenBackGround
        self.backgroundColor = UIColor(red: 24/255, green: 117/255, blue: 104/244, alpha: 1.0)
        
    }
    //MARK: - Actions of Buttons
    @objc func tappedButtonRegister() {
        self.delegate?.actionRegisterButton()
    }
    @objc func tappedBackButton() {
        self.delegate?.backPage()
        
    }
    
    //MARK: - Config delegate TextFields
    
    public func configTextFieldDelegate(delegate: UITextFieldDelegate){
        self.textFielEmail.delegate = delegate
        self.textFielPassword.delegate = delegate
        
    }
    
    //MARK: SetUpConstraints
    private func setUpConstraints() {
        
        let constant: CGFloat = 15
        NSLayoutConstraint.activate([
            
            self.imageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: CGFloat(20)),
            self.imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.imageView.widthAnchor.constraint(equalToConstant: 150),
            self.imageView.heightAnchor.constraint(equalToConstant: 150),
            
            self.backButton.topAnchor.constraint(equalTo: self.imageView.topAnchor),
            self.backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: CGFloat(20)),
            self.backButton.heightAnchor.constraint(equalToConstant: CGFloat(20)),
            self.backButton.widthAnchor.constraint(equalToConstant: CGFloat(20)),
            
            self.textFielEmail.topAnchor.constraint(equalTo: self.imageView.bottomAnchor, constant: constant),
            self.textFielEmail.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: CGFloat(30)),
            self.textFielEmail.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: CGFloat(-30)),
            self.textFielEmail.heightAnchor.constraint(equalToConstant: CGFloat(45)),
            
            self.textFielPassword.topAnchor.constraint(equalTo: self.textFielEmail.bottomAnchor, constant: constant),
            self.textFielPassword.leadingAnchor.constraint(equalTo: self.textFielEmail.leadingAnchor),
            self.textFielPassword.trailingAnchor.constraint(equalTo: self.textFielEmail.trailingAnchor),
            self.textFielPassword.heightAnchor.constraint(equalTo: self.textFielEmail.heightAnchor),
            
            self.registerButton.topAnchor.constraint(equalTo: self.textFielPassword.bottomAnchor, constant: constant),
            self.registerButton.leadingAnchor.constraint(equalTo: self.textFielPassword.leadingAnchor),
            self.registerButton.trailingAnchor.constraint(equalTo: self.textFielPassword.trailingAnchor),
            self.registerButton.heightAnchor.constraint(equalTo: self.textFielPassword.heightAnchor)
            
            
        ])
        
    }
}
