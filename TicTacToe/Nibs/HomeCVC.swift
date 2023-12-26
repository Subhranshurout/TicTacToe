//
//  HomeCVC.swift
//  TicTacToe
//
//  Created by Subhranhu Sekhar Rout on 26/12/23.
//

import UIKit

class HomeCVC: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

}
extension HomeCVC {
    static func prepareToRegister(sender : UICollectionView) {
        sender.register(UINib(nibName: "HomeCVC", bundle: nil), forCellWithReuseIdentifier: "HomeCVC")
        }
}



class RoundView: UIView {
    @IBInspectable var cornerRadious: CGFloat = 0 {
        didSet {
            if cornerRadious == 0 {
                layer.cornerRadius = (self.frame.height * _widthRatio) / 2
            } else {
                layer.cornerRadius = cornerRadious * _widthRatio
            }
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear{
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.masksToBounds = true
    }
}



