//
//  LoadingView.swift
//  PrimeiroAppViewCode
//
//  Created by cassia franco on 23/03/22.
//

import UIKit

class LoadingView: UIView, ViewConfiguration{
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Em andamento..."
        label.font = UIFont(name: "SF Pro Text", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var activity: UIActivityIndicatorView = {
        let loading = UIActivityIndicatorView()
        loading.translatesAutoresizingMaskIntoConstraints = false
        loading.hidesWhenStopped = true
        loading.startAnimating()
        loading.style = .large
        return loading
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupViews() {
        backgroundColor = .white
        self.addSubview(self.descriptionLabel)
        self.addSubview(self.activity)
        self.setupConstraints()
    }
    
    func configViews() {
        
    }
    
    func buildViews() {
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            self.descriptionLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            self.descriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            self.descriptionLabel.centerYAnchor.constraint(equalTo: self.activity.centerYAnchor,constant: -50),
            
            self.activity.centerXAnchor.constraint(equalTo: centerXAnchor),
            self.activity.centerYAnchor.constraint(equalTo: centerYAnchor)
        
        ])
    }
    
    

}
