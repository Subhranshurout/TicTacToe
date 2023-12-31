//
//  HomeCVC.swift
//  TicTacToe
//
//  Created by Subhranhu Sekhar Rout on 26/12/23.
//

import UIKit

class HomeCVC: UICollectionViewCell {

    @IBOutlet weak var textLbl: UILabel!
    @IBOutlet weak var bgView: RoundView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    func prepareUI (playerType : Player) {
        switch playerType {
        case .X:
            bgView.backgroundColor = UIColor.blueV2
            bgView.borderColor = UIColor.blueV1
            bgView.borderWidth = 1
            textLbl.text = "X"
            textLbl.textColor = UIColor.blueV1
        case .O:
            bgView.backgroundColor = UIColor.redV2
            bgView.borderColor = UIColor.redV1
            bgView.borderWidth = 1
            textLbl.text = "O"
            textLbl.textColor = UIColor.redV1
        }
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




import UIKit

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
    }
}
