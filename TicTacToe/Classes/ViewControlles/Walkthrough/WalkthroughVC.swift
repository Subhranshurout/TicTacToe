//
//  WalkthroughVC.swift
//  TicTacToe
//
//  Created by Subhranhu Sekhar Rout on 25/12/23.
//

import UIKit

class WalkthroughVC: ParentVC {
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    
    var arrWalkThrough: [WalkThrough] = []
    var currentIndex : IndexPath = [0,0]
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareData()
    }
    
    
    func prepareData() {
        let obj1 = WalkThrough(imageName: "ic_onboarding1", title: "Welcome", subTitle: "One of the oldest world games now\navailable on your smartphone device!")
        let obj2 = WalkThrough(imageName: "ic_onboarding2", title: "Compete", subTitle: "Play the game with your friends, and prove\nthat you’re a worthy opponent!")
        let obj3 = WalkThrough(imageName: "ic_onboarding3", title: "Scoreboard", subTitle: "Earn points and make your own way to the\ntop of the scoreboard!")
        arrWalkThrough = [obj1, obj2 , obj3]
    }
    
    @IBAction func backBtnClick(_ sender: UIButton) {
        myCollectionView.scrollToItem(at: currentIndex.preViousindex, at: .centeredVertically, animated: true)
    }
    
    @IBAction func nextBtnClick(_ sender: UIButton) {
        if currentIndex.row == arrWalkThrough.count - 1 {
            //Navigate to the game Screen
        } else {
            myCollectionView.scrollToItem(at: currentIndex.nextIndex, at: .centeredVertically, animated: true)
        }
    }
    
    
}

extension WalkthroughVC : UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WalkthroughCVC", for: indexPath) as! WalkthroughCVC
        cell.objWalkThrough = arrWalkThrough[indexPath.item]
        if indexPath.row == 0  {
            backBtn.isHidden = true
        } else {
            backBtn.isHidden = false
        }
        currentIndex = indexPath
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    }
    // Implementing the logic for the current index of `collectionView`
    /// Adding current index to `pageControl`
    /// - Parameter scrollView: Did Scroll
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        var visibleRect = CGRect()
        
        visibleRect.origin = scrollView.contentOffset
        visibleRect.size = myCollectionView.bounds.size
        if let visibleIndexPath = myCollectionView.indexPathForItem(at: CGPoint(x: visibleRect.midX, y: visibleRect.midY)) {
            pageControl.currentPage = visibleIndexPath.row
            currentIndex = visibleIndexPath
            if visibleIndexPath.row == 0  {
                backBtn.isHidden = true
            } else {
                backBtn.isHidden = false
            }
        }
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
