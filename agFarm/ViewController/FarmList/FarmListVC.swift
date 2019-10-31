//
//  FarmDeatailListVC.swift
//  agFarm
//
//  Created by shashikant kadgi on 16/09/19.
//  Copyright © 2019 shashikant kadgi. All rights reserved.
//

import UIKit
import SwiftyJSON
class FarmListVC: UIViewController , ExpandCellDelegate {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var apiClient: APIClient!
    var  errorMessage: String?
    let delegate = UIApplication.shared.delegate as! AppDelegate
  
    var selectedIndex = -1
    var titleArray = ["Aprx year built", "Lot Dimensions", "SqFt Finished & Unfinished", "Total Room Count Above Grade", "Total Units", "County", "Lake/Rivers", "Waterfront/View","Aprx year built", "Lot Dimensions", "SqFt Finished & Unfinished", "Total Room Count Above Grade", "Total Units", "County", "Lake/Rivers", "Waterfront/View"]
    
    var dataArray : [[String:String]] = [["MatchName" : "First Match", "Team1" : "US", "Team2" : "Australia", "Score" : "Score 1-0"], ["MatchName" : "Second Match", "Team1" : "India", "Team2" : "Sri lanka", "Score" : "Score 2-0"], ["MatchName" : "Third Match", "Team1" : "West Indies", "Team2" : "South Africa", "Score" : "Score 2-4"], ["MatchName" : "Fourth Match", "Team1" : "New Zealand", "Team2" : "Holland", "Score" : "Score 0-0"] ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.estimatedRowHeight = 70
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.getFarmFieldData(farmerId: "6", completion: {
            self.tableView.reloadData()
        })
    }
    
    func getFarmFieldData(farmerId: String, completion: @escaping () -> ()) {
        apiClient.getFarmFieldList(farmerId: farmerId) { userData , error  in
            
            guard let userData = userData, error == nil else {
                
                self.errorMessage = error?.localizedDescription
                
                return completion()
            }
            
            let data = userData["data"]["result"] as JSON
            let farm_data = data["farm"].arrayValue
          //  let data = userData.value(forKey: "data") as! NSDictionary
          //  self.delegate.farmList = data.value(forKey: "result") as? NSDictionary
            completion()
        }
    }
    
    
    @IBAction func btnBackTapped(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
//    @IBAction func btnAddNewFarmTapped(_ sender: Any) {
//        
//        let obj = self.storyboard?.instantiateViewController(withIdentifier: "AddFarmDetails") as! AddFarmDetails
//        self.navigationController?.pushViewController(obj, animated: true)
//    }
    
    @IBAction func btnAddFieldTapped(_ sender: Any) {
        
        let obj = self.storyboard?.instantiateViewController(withIdentifier: "FieldDetailsVC") as! FieldDetailsVC
        self.navigationController?.pushViewController(obj, animated: true)
    }
    
    @IBAction func btnSatelliteViewTapped(_ sender: Any) {
        
        let obj = self.storyboard?.instantiateViewController(withIdentifier: "SatelliteVC") as! SatelliteVC
        self.navigationController?.pushViewController(obj, animated: true)
        
    }
   
    @IBAction func btnAddNewFarmTapped(_ sender: Any) {
        
        let obj = self.storyboard?.instantiateViewController(withIdentifier: "AddFarmDetailsVC") as! AddFarmDetailsVC
        self.navigationController?.pushViewController(obj, animated: true)
    }
}

extension FarmListVC : UITableViewDataSource , UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
      if (section == 0)
      {
        return 1
      }
      else
      {
        return dataArray.count
      }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        guard let cell:FarmCell = tableView.dequeueReusableCell(withIdentifier: "FarmCell", for: indexPath) as? FarmCell else {
//
//            return UITableViewCell()
//        }
        
        if (indexPath.section == 0){

            let cell = tableView.dequeueReusableCell(withIdentifier: "FarmCell", for: indexPath) as! FarmCell
           // let update = updates[indexPath.row]
            
           // cell.nameLabel.text = update.addedByUser
      
            
            return cell
        }
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FieldCell", for: indexPath) as! FieldCell
           // let updateTask = updatesTask[indexPath.row]
            
           // cell.nameLabel.text = updateTask.addedByUser
             let obj = dataArray[indexPath.row]
            cell.btnExpand.tag = indexPath.row
            cell.delegate = self
            
            return cell
   
           
        }
     
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if (indexPath.section == 0) {
      
            return self.tableView.frame.size.height
        }
        else
        {
            if(selectedIndex == indexPath.row) {
                
                return UITableView.automaticDimension;
                
            } else {
                
                return 70;
            }
            
        }
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    

    func updateTableView(row: Int) {
        if(selectedIndex == row) {
            selectedIndex = -1
        } else {
            selectedIndex = row
        }
//        let index = NSIndexPath(row: row, section: 1)
//        UIView.setAnimationsEnabled(false)
//        self.tableView.beginUpdates()
//        self.tableView.reloadRows(at: [index as IndexPath], with: UITableView.RowAnimation.none)
//        self.tableView.endUpdates()
        
        let path: NSIndexPath = NSIndexPath(row: row, section: 1)
        UIView.setAnimationsEnabled(false)
        self.tableView.beginUpdates()
        self.tableView.reloadRows(at: [path as IndexPath], with: UITableView.RowAnimation.automatic )
        self.tableView.endUpdates()
    }
    
    
  
   
}
