//
//  UserDetailTableViewCell.swift
//  PrimeiroAppViewCode
//
//  Created by cassia franco on 20/10/21.
//

import UIKit
import SnapKit

class UserDetailTableViewCell: UITableViewCell {
    
    static let identifier: String = "UserDetailTableViewCell"
    
    lazy var descriptionCell: UserDetailView = {
        let view = UserDetailView()
        return view
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(descriptionCell)
        self.configDescriptionCellConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    public func setupCell(name: String){
        self.descriptionCell.configNameLabel(name: name)
    }
    //MARK: - Snapkit
    func configDescriptionCellConstraints(){
        self.descriptionCell.snp.makeConstraints{ (make) in
            make.edges.equalToSuperview()
        }
    }
}
