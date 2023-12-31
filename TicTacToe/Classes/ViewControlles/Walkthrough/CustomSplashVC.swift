//
//  CustomSplashVC.swift
//  TicTacToe
//
//  Created by Subhranhu Sekhar Rout on 27/12/23.
//

import UIKit

class CustomSplashVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
    }
}

extension CustomSplashVC {
    
    func prepareUI() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {[weak self] in
            guard let weakSelf = self else {return}
            weakSelf.navigateUser()
        }
    }
    
    func navigateUser() {
        _appDelegator.isAppOpenForFirstTime()
    }
}
