//
//  Exercise.swift
//  WorkOut
//
//  Created by Alaster on 26.03.2024.
//

import Foundation
import UIKit

class ExerciseDisplayTimerViewControler:  UIViewController{
    
    
    
    let dataManager = UserDataManager.shared
    
    override func viewDidLoad() {
            super.viewDidLoad()
        
        exerciseTimerTableView.delegate = self
        exerciseTimerTableView.dataSource = self
        exerciseTimerTableView.contentInset = .zero
        
        exerciseTimerTableView.register(ItemTableViewCell.self, forCellReuseIdentifier: "ItemTableViewCell")

        exerciseTimerTableView.register(UINib(nibName: "ItemTableViewCell", bundle: nil), forCellReuseIdentifier: "ItemTableViewCell")
        
        updateTableView()
        
        }
   
    @IBOutlet weak var exerciseTimerTableView: UITableView!
    
    @IBOutlet weak var timerExerciseLabel: UILabel!
    
    @IBOutlet weak var nowExerciseLabel: UILabel!
    
    
    func updateTableView()  {
        
        exerciseTimerTableView.reloadData()
        
        
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if let vc = segue.destination as? InputWorkOutInformationController {
            vc.delegate = self
        }
    }
}


extension ExerciseDisplayTimerViewControler : UITableViewDelegate{

}

extension ExerciseDisplayTimerViewControler : UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       let dataManager = UserDataManager.shared.getUserDataArray().count
        return dataManager
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ItemTableViewCell") as? ItemTableViewCell
        {
            let item =  UserDataManager.shared.getUserDataArray()[indexPath.row]
            cell.workOutName.text = item.workName
            cell.workOutTimeWorkAndRest.text = "Work time: \(item.approachTime) Rest time:\(item.restTime)"
            

            return cell
        }
            return UITableViewCell()
    }
    
    
}

extension ExerciseDisplayTimerViewControler: InputWorkOutInformationControllerDelegate {
    func refreshData() {
        exerciseTimerTableView.reloadData()
    }
}
