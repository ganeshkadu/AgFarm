//
//  CardViewController.swift
//  CardViewAnimation
//
//  Created by Brian Advent on 26.10.18.
//  Copyright © 2018 Brian Advent. All rights reserved.
//

import UIKit

class CardViewController: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var handleArea: UIView!
    var titleArray = ["Aprx year built", "Lot Dimensions", "SqFt Finished & Unfinished", "Total Room Count Above Grade", "Total Units", "County", "Lake/Rivers", "Waterfront/View","Aprx year built", "Lot Dimensions", "SqFt Finished & Unfinished", "Total Room Count Above Grade", "Total Units", "County", "Lake/Rivers", "Waterfront/View"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let flowLayout = UICollectionViewFlowLayout()
    
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 0
    
        self.collectionView.collectionViewLayout = flowLayout
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.contentInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5);
        self.collectionView.register(UINib.init(nibName: "WeatherInfoCell", bundle: nil), forCellWithReuseIdentifier: "WeatherInfoCell")
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.titleArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeatherInfoCell", for: indexPath as IndexPath) as! WeatherInfoCell
//            cell.cardEffect.layer.cornerRadius = 10
//            cell.cardEffect.layer.shadowColor = UIColor.clear.cgColor
//            cell.cardEffect.layer.shadowOpacity = 0.5
//            cell.cardEffect.layer.shadowOpacity = 10.5
//            cell.cardEffect.layer.shadowOffset = .zero
//            cell.cardEffect.layer.shadowPath = UIBezierPath(rect: cell.cardEffect.bounds).cgPath
//            cell.cardEffect.layer.shouldRasterize = true
      
    
        return cell
    }
}

extension CardViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
         let padding: CGFloat = 5
         let collectionCellSize = self.collectionView.frame.size.width - padding
        
        return CGSize(width: collectionCellSize/3, height: 250)
        
    }
    
}
