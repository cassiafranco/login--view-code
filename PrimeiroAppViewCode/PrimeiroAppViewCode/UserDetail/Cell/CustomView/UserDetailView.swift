//
//  UserDetailView.swift
//  PrimeiroAppViewCode
//
//  Created by cassia franco on 20/10/21.
//

import UIKit

class UserDetailView: UIView {
    
    lazy var userImageView:UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(systemName: "person")
        view.contentMode = .scaleAspectFit
        return view
    }()
    lazy var nameLabel:UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .black
        return view
        
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.detailSubviews()
        self.setUpContraints()
    }
    
    public func configNameLabel(name: String) {
        self.nameLabel.text = name
    }
    private func detailSubviews(){
        self.addSubview(self.userImageView)
        self.addSubview(self.nameLabel)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - setUpContraints
    
    private func setUpContraints(){
        NSLayoutConstraint.activate([
            self.userImageView.topAnchor.constraint(equalTo: self.topAnchor),
            self.userImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.userImageView.heightAnchor.constraint(equalToConstant: CGFloat(80)),
            self.userImageView.widthAnchor.constraint(equalToConstant: CGFloat(80)),
            
            self.nameLabel.topAnchor.constraint(equalTo: self.userImageView.topAnchor),
            self.nameLabel.leftAnchor.constraint(equalTo: self.userImageView.rightAnchor, constant: CGFloat(20)),
        
        ])
    }
    
    
}
