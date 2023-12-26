//
//  Constants.swift
//  TicTacToe
//
//  Created by Subhranhu Sekhar Rout on 26/12/23.
//

import Foundation
import UIKit

let _heightRatio : CGFloat = {
    let ratio = _screenSize.height/736
    return ratio
}()

let _widthRatio : CGFloat = {
    let ratio = _screenSize.width/414
    return ratio
}()
/*---------------------------------------------------
Screen Size
---------------------------------------------------*/
let _screenSize     = UIScreen.main.bounds.size
let _screenFrame    = UIScreen.main.bounds

/*---------------------------------------------------
 Constants
 ---------------------------------------------------*/
let _defaultCenter  = NotificationCenter.default
let _userDefault    = UserDefaults.standard
let _appDelegator   = UIApplication.shared.delegate! as! AppDelegate
let _application    = UIApplication.shared
