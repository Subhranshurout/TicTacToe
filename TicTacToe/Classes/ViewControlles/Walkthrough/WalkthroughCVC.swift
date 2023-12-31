//
//  WalkthroughCVC.swift
//  TicTacToe
//
//  Created by Subhranhu Sekhar Rout on 25/12/23.
//

import UIKit

/// WalkThrough Model
struct WalkThrough {
    var imageName : String!
    var title :  String!
    var subTitle : String!
}

class WalkthroughCVC: UICollectionViewCell {
    //MARK: - Outlets
    @IBOutlet weak var subTitleLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var previewImage: UIImageView!

    /// Using compute variable for filling data
    var objWalkThrough: WalkThrough! {
        didSet {
            previewImage.image = UIImage(named: objWalkThrough.imageName)
            titleLbl.text = objWalkThrough.title
            subTitleLbl.text = objWalkThrough.subTitle
        }
    }
}

