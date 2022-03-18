//
//  RegisterScreen.swift
//  PrimeiroAppViewCode
//
//  Created by cassia franco on 18/10/21.
//

import UIKit
import SnapKit

class RegisterScreen: UIView {
    
    weak var delegate: RegisterScreenProtocol?
    
    func delegate(delegate:RegisterScreenProtocol?){
        self.delegate = delegate
    }
    //MARK: - Create elements
    lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "add")
        view.contentMode = .scaleAspectFit
        return view
    }()
    lazy var textFullName: UITextField = {
        let view = UITextField()
        view.placeholder = "Nome"
        view.autocorrectionType = .no
        view.backgroundColor = .white
        view.keyboardType = .default
        view.clearButtonMode = .whileEditing
        view.borderStyle = .roundedRect
        view.font = UIFont.systemFont(ofSize: 14)
        view.textColor = .darkGray
        return view
    }()
    
    lazy var textFielEmail: UITextField = {
        let view = UITextField()
        view.backgroundColor = .white
        view.placeholder = "Insire seu e-mail"
        view.borderStyle = .roundedRect
        view.autocorrectionType = .no
        view.keyboardType = .emailAddress
        view.keyboardType = .default
        view.clearButtonMode = .whileEditing
        view.font = UIFont.systemFont(ofSize: 14)
        view.textColor = .darkGray
        
        return view
    }()
    lazy var textFielPassword: UITextField = {
        let view = UITextField()
        view.backgroundColor = .white
        view.placeholder = "Insire uma senha"
        view.borderStyle = .roundedRect
        view.keyboardType = .default
        view.autocorrectionType = .no
        view.clearButtonMode = .whileEditing
        view.font = UIFont.systemFont(ofSize: 14)
        view.textColor = .darkGray
        view.isSecureTextEntry = true
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
        self.backgroundColor = UIColor.greenBackground()
        //-------------------------
        self.configImageConstraints()
        self.configEmailConstraints()
        self.configPasswordConstraints()
        self.configRegisterConstraints()
        self.configNameConstraints()
        //-------------------------
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - SubViews
    private func getUpSubViews(){
        self.addSubview(self.imageView)
        self.addSubview(self.textFielEmail)
        self.addSubview(self.textFielPassword)
        self.addSubview(self.registerButton)
        self.addSubview(self.textFullName)
        
    }
    //MARK: - Actions of Buttons
    @objc func tappedButtonRegister() {
        self.delegate?.actionRegisterButton()
        
    }
    
    //MARK: - Config delegate TextFields
    
    public func configTextFieldDelegate(delegate: UITextFieldDelegate){
        self.textFielEmail.delegate = delegate
        self.textFielPassword.delegate = delegate
        
    }
    
    //MARK: - SnapKit
    private func configImageConstraints() {
        self.imageView.snp.makeConstraints { (make) in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(20)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(150)
        }
    }
    func configNameConstraints() {
        self.textFullName.snp.makeConstraints{ (make) in
            make.top.equalTo(self.imageView.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(45)
        }
    }
    func configEmailConstraints() {
        self.textFielEmail.snp.makeConstraints{ (make) in
            make.top.equalTo(self.textFullName.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(45)
        }
    }
    func configPasswordConstraints() {
        self.textFielPassword.snp.makeConstraints{ (make) in
            make.top.equalTo(self.textFielEmail.snp.bottom).offset(15)
            make.leading.equalTo(self.textFielEmail.snp.leading)
            make.trailing.equalTo(self.textFielEmail.snp.trailing)
            make.height.equalTo(self.textFielEmail.snp.height)
        }
    }
    func configRegisterConstraints() {
        self.registerButton.snp.makeConstraints{ (make) in
            make.top.equalTo(self.textFielPassword.snp.bottom).offset(20)
            make.leading.equalTo(self.textFielPassword.snp.leading)
            make.trailing.equalTo(self.textFielPassword.snp.trailing)
            make.height.equalTo(self.textFielPassword.snp.height)

        }
    }

}
