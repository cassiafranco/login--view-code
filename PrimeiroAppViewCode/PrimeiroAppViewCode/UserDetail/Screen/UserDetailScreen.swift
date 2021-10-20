//
//  UserDetailScreen.swift
//  PrimeiroAppViewCode
//
//  Created by cassia franco on 20/10/21.
//

import UIKit

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
        self.setUpConstraints()
        self.customColor()
        
    }
    
    private func tableSubViews() {
        self.addSubview(self.tableView)
        
    }
    //MARK: - Method SetupColor
    private func customColor(){
        // .greenBackGround
        self.backgroundColor = UIColor(red: 24/255, green: 117/255, blue: 104/244, alpha: 1.0)
        
    }
    //MARK: - Config Table Delegate
    public func configTableViewDelegate(delegate:UITableViewDelegate, dataSource:UITableViewDataSource){
        self.tableView.delegate = delegate
        self.tableView.dataSource = dataSource
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Method Constraints
    private func setUpConstraints(){
        NSLayoutConstraint.activate([
            
            self.tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.tableView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor),
            self.tableView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            
            
        ])
    }
    
}
