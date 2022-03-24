//
//  NavView.swift
//  PrimeiroAppViewCode
//
//  Created by cassia franco on 21/03/22.
//

import UIKit

class NavView: UIView, ViewConfiguration{
    
    weak var delegate: NavViewProtocol?
    
    func delegate(delegate: NavViewProtocol) {
        self.delegate = delegate
    }
    //MARK: - Create elements
    lazy var navBackgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 35
        view.clipsToBounds = true
        view.layer.maskedCorners = [.layerMaxXMaxYCorner]
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 5)
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius =  10
        
        return view
    }()
    lazy var navBar: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    lazy var searchBar: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = CustomColor.appLight
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        
        return view
    }()
    lazy var messageView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 2
        return view
    }()
    lazy var searchLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: CustomFont.popMedium, size: 16)
        label.text = "Digite aqui"
        label.textColor = .gray
        return label
    }()
    lazy var searchButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "magnifyingglass")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .systemPink
        return button
    }()
    lazy var conversationButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "person.badge.plus")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .systemPink
        button.addTarget(self, action: #selector(tappedConversationRegister), for: .touchUpInside)
        return button
    }()
    lazy var messageButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "message")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .systemPink
        button.addTarget(self, action: #selector(self.tappedContactButton), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Action of button
    @objc func tappedConversationRegister () {
        self.delegate?.typeScreenMessage(type: .conversation)
        self.conversationButton.tintColor = .systemPink
        self.messageButton.tintColor = .black
        
    }
    @objc func tappedContactButton (){
        self.delegate?.typeScreenMessage(type: .contact)
        self.messageButton.tintColor = .systemPink
        self.conversationButton.tintColor = .black
        
    }
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
        self.setupConstraints()
    }
    func configViews() {
        
    }
    
    func buildViews() {
        
    }
    
    func setupViews() {
        self.addSubview(self.navBackgroundView)
        self.navBackgroundView.addSubview(self.navBar)
        self.navBar.addSubview(self.searchBar)
        self.searchBar.addSubview(self.searchLabel)
        self.searchBar.addSubview(self.searchButton)
        self.navBar.addSubview(self.messageView)
        self.messageView.addSubview(self.conversationButton)
        self.messageView.addSubview(self.messageButton)

    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            self.navBackgroundView.topAnchor.constraint(equalTo: self.topAnchor),
            self.navBackgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.navBackgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.navBackgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            self.navBar.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.navBar.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.navBar.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.navBar.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            self.searchBar.leadingAnchor.constraint(equalTo: self.navBar.leadingAnchor,constant: 30),
            self.searchBar.trailingAnchor.constraint(equalTo: self.navBar.trailingAnchor, constant:  -150),
            self.searchBar.centerYAnchor.constraint(equalTo: self.navBar.centerYAnchor),
            self.searchBar.heightAnchor.constraint(equalToConstant: 55),
            
            
            self.messageView.trailingAnchor.constraint(equalTo: self.navBar.trailingAnchor, constant: -30),
            self.messageView.centerYAnchor.constraint(equalTo: self.navBar.centerYAnchor),
            self.messageView.heightAnchor.constraint(equalToConstant: 55),
            self.messageView.widthAnchor.constraint(equalToConstant: 100),
            
            self.messageButton.leadingAnchor.constraint(equalTo: messageView.leadingAnchor, constant: 20),
            self.messageButton.centerYAnchor.constraint(equalTo: messageView.centerYAnchor),
            
            self.conversationButton.trailingAnchor.constraint(equalTo: messageView.trailingAnchor, constant: -25),
            self.conversationButton.centerYAnchor.constraint(equalTo: messageView.centerYAnchor),
            
            self.searchLabel.leadingAnchor.constraint(equalTo: searchBar.leadingAnchor, constant: 25),
            self.searchLabel.centerYAnchor.constraint(equalTo: searchBar.centerYAnchor),
            
            
            
            self.searchButton.trailingAnchor.constraint(equalTo: searchBar.trailingAnchor, constant: -20),
            self.searchButton.centerYAnchor.constraint(equalTo: searchBar.centerYAnchor),
            self.searchButton.widthAnchor.constraint(equalToConstant: 20),
            self.searchButton.heightAnchor.constraint(equalToConstant: 20),
        
        ])
    }
    
}
