//
//  HomeScreen.swift
//  PrimeiroAppViewCode
//
//  Created by cassia franco on 21/03/22.
//

import UIKit

class HomeScreen: UIView {
    
    lazy var navView: NavView = {
        let view = NavView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addNewSubview()
        self.setupConstraints()
    }
    private func addNewSubview() {
        self.addSubview(self.navView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.navView.topAnchor.constraint(equalTo: self.topAnchor),
            self.navView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.navView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.navView.heightAnchor.constraint(equalToConstant: 140)
        
        ])
    }

}
