//
//  UserDetailView.swift
//  PrimeiroAppViewCode
//
//  Created by cassia franco on 20/10/21.
//

import UIKit
import SnapKit

class UserDetailView: UIView {
    //MARK: - Create elements
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
    //MARK: - Super view construction
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.detailSubviews()
        self.configUserImageConstraints()
        self.configNameLabelConstraints()
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
    //MARK: - SnapKit
    func configUserImageConstraints(){
        self.userImageView.snp.makeConstraints{ (make) in
            make.centerY.leading.equalToSuperview()
            make.height.width.equalTo(80)
        }
    }
    func configNameLabelConstraints(){
        self.nameLabel.snp.makeConstraints{ (make) in
            make.centerY.equalToSuperview()
            make.leading.equalTo(self.userImageView.snp.trailing).offset(20)
        }
    }
}
