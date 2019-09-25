//
//  HomeVC.swift
//  ProjectModelDemo
//
//  Created by shashikant kadgi on 03/09/19.
//  Copyright © 2019 shashikant kadgi. All rights reserved.
//

import UIKit

class HomeVC: UIViewController , UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var basketTop: UIView!
    @IBOutlet weak var basketBottom: UIView!
    
    @IBOutlet weak var farmCollectionView: UICollectionView!
    var thisWidth:CGFloat = 0
    var thisHeight:CGFloat = 0

     var temp = ["hi","asdas","adas","dadad","asdadf","adadfa"]
//    @IBOutlet weak var basketTopConstraint: NSLayoutConstraint!
//    @IBOutlet weak var basketBottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
       openBasket()
        
        DispatchQueue.main.async {
            let flowLayout = UPCarouselFlowLayout()
            flowLayout.itemSize = CGSize(width: self.farmCollectionView.frame.size.width, height: self.farmCollectionView.frame.size.height)
            flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            flowLayout.scrollDirection = .horizontal
            flowLayout.sideItemScale = 0.8
            flowLayout.sideItemAlpha = 1.0
            flowLayout.minimumInteritemSpacing = 0
            flowLayout.minimumLineSpacing = 0
            //  flowLayout.spacingMode = .fixed(spacing: 5.0)
            self.farmCollectionView.collectionViewLayout = flowLayout
            self.farmCollectionView.delegate = self
            self.farmCollectionView.dataSource = self
        }
        
    }
    @IBAction func btnBackTapped(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func btnAddNewFarmTapped(_ sender: Any) {
        
        let obj = self.storyboard?.instantiateViewController(withIdentifier: "FieldDetailsVC") as! FieldDetailsVC
        self.navigationController?.pushViewController(obj, animated: true)
    }
    
    @IBAction func btnSatelliteViewTapped(_ sender: Any) {
        
        let obj = self.storyboard?.instantiateViewController(withIdentifier: "SatelliteVC") as! SatelliteVC
        self.navigationController?.pushViewController(obj, animated: true)
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return temp.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let cell:FarmDeatailsCell = (collectionView.dequeueReusableCell(withReuseIdentifier: "FarmDeatailsCell", for: indexPath)  as? FarmDeatailsCell)!
      cell.cntView.layer.cornerRadius = 10
      cell.cntView.layer.shadowColor = UIColor.clear.cgColor
      cell.cntView.layer.shadowOpacity = 0.5
      cell.cntView.layer.shadowOpacity = 10.5
      cell.cntView.layer.shadowOffset = .zero
      cell.cntView.layer.shadowPath = UIBezierPath(rect: cell.cntView.bounds).cgPath
      cell.cntView.layer.shouldRasterize = true
      //cell.lblName.text = temp[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
       // self.pageControl.currentPage = indexPath.section
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
        return CGSize(width: farmCollectionView.frame.size.width, height: farmCollectionView.frame.size.height)
    }

    func openBasket() {
        
       // basketTopConstraint.constant -= basketTop.frame.size.height
     //   basketBottomConstraint.constant -= basketBottom.frame.size.height
    
        UIView.animate(withDuration: 0.7, delay: 1.0, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: { finished in
            print("Basket doors opened!")
        })
    }

    @IBAction func btnPreviousTapped(_ sender: Any) {
        
        
    }
    
    @IBAction func btnNextTapped(_ sender: Any) {
        
        let indexPath = NSIndexPath(row: 1, section: 0)
        farmCollectionView.scrollToItem(at: indexPath as IndexPath, at: .centeredHorizontally, animated: true)
    }
  
    
}
