//
//  UserDetailScreen.swift
//  PrimeiroAppViewCode
//
//  Created by cassia franco on 20/10/21.
//

import UIKit
import SnapKit

class UserDetailScreen: UIView {
    
    //MARK: - Create elements
    lazy var tableView:UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.register(UserDetailTableViewCell.self, forCellReuseIdentifier: UserDetailTableViewCell.identifier)
        return view
        
    }()
    //MARK: - Super view construction
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.tableSubViews()
        self.backgroundColor =  CustomColor.greenBackground
        self.configTableViewContraints()
        
    }
    
    private func tableSubViews() {
        self.addSubview(self.tableView)
    }
    //MARK: - Config Table Delegate
    public func configTableViewDelegate(delegate:UITableViewDelegate, dataSource:UITableViewDataSource){
        self.tableView.delegate = delegate
        self.tableView.dataSource = dataSource
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - SnapKit
    func configTableViewContraints(){
        self.tableView.snp.makeConstraints{ (make) in
            make.edges.equalTo(self.safeAreaLayoutGuide)
            
        }
    }
}
