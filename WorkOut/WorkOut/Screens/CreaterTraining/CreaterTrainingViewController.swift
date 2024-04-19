//
//  ViewController.swift
//  WorkOut
//
//  Created by Alaster on 25.03.2024.
//

import UIKit

class CreaterTrainingViewController:  UIViewController {
   
    
        
    @IBOutlet weak var exerciseTableView: UITableView!
    
    @IBOutlet weak var addNewWorkout: UIStackView!
    
   
    
    
    
    let dataManager = UserDataManager.shared
      
   
    
    override func viewDidLoad() {
            super.viewDidLoad()
        exerciseTableView.delegate = self
        exerciseTableView.dataSource = self
        exerciseTableView.contentInset = .zero
       
        addNewWorkout.layer.cornerRadius = 10
        
        addNewWorkout.clipsToBounds = true
        
        
        self.navigationItem.title = "Fitness"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.05200000107, green: 0.3100000024, blue: 0.4970000088, alpha: 1) ]
       
        
        
        /*let rightButton = UIBarButtonItem(title: "Edit", style: .plain , target: self, action: #selector(editTapped))
             navigationItem.rightBarButtonItem = rightButton*/
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(editTapped))
        addNewWorkout.addGestureRecognizer(tapGesture)
        
       
        exerciseTableView.register(ItemTableViewCell.self, forCellReuseIdentifier: "ItemTableViewCell")
        
        exerciseTableView.register(UINib(nibName: "ItemTableViewCell", bundle: nil), forCellReuseIdentifier: "ItemTableViewCell")
        }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        exerciseTableView.reloadData()
    }
    
    @objc func editTapped() {
        
        
        if let inputWorkoutController = storyboard?.instantiateViewController(withIdentifier: "InputWorkOutInformationController") as? InputWorkOutInformationController{
            inputWorkoutController.delegate = self
           present(inputWorkoutController, animated: true, completion: nil)
            // show(inputWorkoutController, sender: self)
        }
        
        
       
        
    }
    
    
    
    func updateTableView()  {
        exerciseTableView.reloadData()
    }
    
   
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if let vc = segue.destination as? InputWorkOutInformationController {
            vc.delegate = self
        }
    }
    
    
    
    
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        let dataManager = UserDataManager.shared.getUserDataArray().count
        if dataManager == 0  {
            
        let alertAlert = UIAlertController(title: "Alert", message: "Exercise miss", preferredStyle: .alert)
        
            let actionOk = UIAlertAction(title: "Ok", style: .default)
        
        
        alertAlert.addAction(actionOk)
        
                   self.present(alertAlert, animated: true)
            
            return false
        }
        else {
            
            return  true
        }
    }
        
    
    
    
}

extension CreaterTrainingViewController : UITableViewDelegate{
    
}

extension CreaterTrainingViewController : UITableViewDataSource{
    
    
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

extension CreaterTrainingViewController: InputWorkOutInformationControllerDelegate {
    func refreshData() {
        exerciseTableView.reloadData()
    }
}
