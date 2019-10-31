//
//  FarmCell.swift
//  agFarm
//
//  Created by shashikant kadgi on 16/09/19.
//  Copyright © 2019 shashikant kadgi. All rights reserved.
//

import UIKit

class FarmCell: UITableViewCell , UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var btnPrevious: UIButton!
    
    var titleArray = ["Aprx year built", "Lot Dimensions", "SqFt Finished & Unfinished", "Total Room Count Above Grade", "Total Units", "County", "Lake/Rivers", "Waterfront/View","Aprx year built", "Lot Dimensions", "SqFt Finished & Unfinished", "Total Room Count Above Grade", "Total Units", "County", "Lake/Rivers", "Waterfront/View"]
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
     //   DispatchQueue.main.async {
            let flowLayout = UICollectionViewFlowLayout()
            flowLayout.itemSize = CGSize(width: self.collectionView.frame.size.width , height: self.collectionView.frame.size.height)
          //  flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

            flowLayout.scrollDirection = .horizontal
//            flowLayout.sideItemScale = 0.8
//            flowLayout.sideItemAlpha = 1.0
            flowLayout.minimumInteritemSpacing = 0
            flowLayout.minimumLineSpacing = 0
            //flowLayout.spacingMode = .fixed(spacing: 5.0)
            self.collectionView.collectionViewLayout = flowLayout
            self.collectionView.dataSource = self
            self.collectionView.delegate = self
            self.collectionView.contentInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5);
            self.collectionView.register(UINib.init(nibName: "FarmListCell", bundle: nil), forCellWithReuseIdentifier: "FarmListCell")
      //  }
        
        self.btnNext.addTarget(self, action: #selector(scrollToNextFarm(sender:)), for: .touchUpInside)
        self.btnPrevious.addTarget(self, action: #selector(scrollToPreviousFarm(sender:)), for: .touchUpInside)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.titleArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FarmListCell", for: indexPath as IndexPath) as! FarmListCell
        
        
//        cell.cntView.layer.cornerRadius = 10
//        cell.cntView.layer.shadowColor = UIColor.clear.cgColor
//        cell.cntView.layer.shadowOpacity = 0.5
//        cell.cntView.layer.shadowOpacity = 10.5
//        cell.cntView.layer.shadowOffset = .zero
//        cell.cntView.layer.shadowPath = UIBezierPath(rect: cell.cntView.bounds).cgPath
//        cell.cntView.layer.shouldRasterize = true
        //cell.lblName.text = temp[indexPath.row]
        
        return cell
    }
    
//    func collectionView(collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        insetForSectionAtIndex section: Int) -> UIEdgeInsets {
//
//        return UIEdgeInsets(top: 5.0, left: 5.0, bottom: 5.0, right: 5.0)
//    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        // self.pageControl.currentPage = indexPath.section
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        return CGSize(width: self.collectionView.frame.size.width, height: self.frame.size.height)
//    }

    @objc func scrollToNextFarm(sender: UIButton){
        
        DispatchQueue.main.async {
            
            let visibleItems: NSArray = self.collectionView.indexPathsForVisibleItems as NSArray
            let currentItem: IndexPath = visibleItems.object(at: 0) as! IndexPath
            let nextItem: IndexPath = IndexPath(item: currentItem.item + 1, section: 0)
            // This part here
             print(nextItem)
            if nextItem.row < self.titleArray.count {
                //self.collectionView.scrollToItem(at: nextItem, at: .left, animated: true)
                print("scrolled")
             
                self.collectionView.scrollToItem(at: nextItem , at: .centeredHorizontally, animated: true)
            }
            if nextItem.row == self.titleArray.count-1
            {
                self.btnNext.setTitleColor(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1), for: .normal)
            
            }
            
        }
       
    }
    @objc func scrollToPreviousFarm(sender: UIButton){
        
        DispatchQueue.main.async {
            
            let visibleItems: NSArray = self.collectionView.indexPathsForVisibleItems as NSArray
            let currentItem: IndexPath = visibleItems.object(at: 0) as! IndexPath
            let nextItem: IndexPath = IndexPath(item: currentItem.item - 1, section: 0)
            // This part here
            print(nextItem)
            if nextItem.row < self.titleArray.count {
                //self.collectionView.scrollToItem(at: nextItem, at: .left, animated: true)
                print("scrolled")
                
                self.collectionView.scrollToItem(at: nextItem , at: .centeredHorizontally, animated: true)
                self.btnNext.setTitleColor(#colorLiteral(red: 0.1976502538, green: 0.4287701845, blue: 0.2695204318, alpha: 1), for: .normal)
            }
            if nextItem.row == 0
            {
                self.btnPrevious.setTitleColor(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1), for: .normal)
                
            }
            
        }
        
    }
    
}


extension FarmCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
       // let padding: CGFloat = 25
     //   let collectionCellSize = gridCollectionView.frame.size.width - padding
        
        return CGSize(width: self.collectionView.frame.size.width, height: self.collectionView.frame.size.height)
        
    }
    
}
