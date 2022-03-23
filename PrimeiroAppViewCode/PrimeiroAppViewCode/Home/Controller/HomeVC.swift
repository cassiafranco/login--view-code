//
//  HomeVC.swift
//  PrimeiroAppViewCode
//
//  Created by cassia franco on 21/03/22.
//

import UIKit

class HomeVC: UIViewController {
    
    var homeScreen: HomeScreen?
    
    private var loading : LoadingView = {
        let loading = LoadingView()
        
        return loading
    }()
    
    override func loadView() {
//        self.homeScreen = HomeScreen()
//        self.view = self.homeScreen
        self.view = self.loading
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

}
