//
//  UserDetailVC.swift
//  PrimeiroAppViewCode
//
//  Created by cassia franco on 20/10/21.
//

import UIKit

class UserDetailVC: UIViewController {
    var userDetailScreen: UserDetailScreen?
    
    override func loadView() {
        self.userDetailScreen = UserDetailScreen()
        self.userDetailScreen?.configTableViewDelegate(delegate: self, dataSource: self)
        self.view = self.userDetailScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}

extension UserDetailVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UserDetailTableViewCell? = tableView.dequeueReusableCell(withIdentifier: UserDetailTableViewCell.identifier, for: indexPath) as? UserDetailTableViewCell
        
        cell?.setupCell(name: "Cassia Franco")
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
}
