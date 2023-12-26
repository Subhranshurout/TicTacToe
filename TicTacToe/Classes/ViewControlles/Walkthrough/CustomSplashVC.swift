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
//        imgAnimate.loadGif(name: "Splash")
        DispatchQueue.main.asyncAfter(deadline: .now()) {[weak self] in
            guard let weakSelf = self else {return}
            weakSelf.navigateUser()
//            weakSelf.imgAnimate.image = nil
        }
    }
    
    func navigateUser() {
        _appDelegator.isAppOpenForFirstTime()
    }
}
