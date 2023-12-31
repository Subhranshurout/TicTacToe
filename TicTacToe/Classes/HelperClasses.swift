//
//  HelperClasses.swift
//  TicTacToe
//
//  Created by Subhranhu Sekhar Rout on 31/12/23.
//

import Foundation
import UIKit

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


class CustomRoundedButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }

    private func setupButton() {
        layer.cornerRadius = 5.0
        layer.borderWidth = 2
        layer.borderColor = UIColor.labelV1.cgColor
        clipsToBounds = true
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = CGSize(width: -2, height: 2)
        self.layer.shadowRadius = 2
        self.layer.shouldRasterize = true
    }
}

extension IndexPath {
    var preViousindex : IndexPath  {
        let index = self.row - 1
        var path = self
        path.row = index
        return path
    }
    
    var nextIndex : IndexPath  {
        let index = self.row + 1
        var path = self
        path.row = index
        return path
    }
}
