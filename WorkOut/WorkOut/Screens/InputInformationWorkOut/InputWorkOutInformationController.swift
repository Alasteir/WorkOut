

import UIKit

protocol InputWorkOutInformationControllerDelegate: class {
    func refreshData()
}

class InputWorkOutInformationController: UIViewController {
    
    weak var createrController : CreaterTrainingViewController?
    
    @IBOutlet weak var imageForWorkOutCell: UIImageView!
    
    @IBOutlet weak var workName: UITextField!
    
    @IBOutlet weak var approachTime: UITextField!
    
    @IBOutlet weak var restTime: UITextField!
    
    @IBOutlet weak var saveInformationWorkOut: UIButton!
    
    weak var delegate: InputWorkOutInformationControllerDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        saveInformationWorkOut.addTarget(self, action: #selector(saveButtonTapped) , for: .touchUpInside)
        
    }
    
    @objc func saveButtonTapped() {
            
            addWorkOutInformation()
        }
    
    
    
    func checkVariablesNotEmpty(_ variables: Any?...) -> Bool {
        for variable in variables {
            
            if let variable = variable as? String {
                
                if variable.isEmpty {
                    
                    return false
                }
            }
            else {
                if variable == nil {
                    return false
                }
            }
        }
        
        return true
    }
    
    
    func addWorkOutInformation() {
        
        let workNameText = workName.text ?? ""
        
        let approachTimeText = approachTime.text ?? ""
        
        let restTimeText = restTime.text ?? ""
        
        
    
        if self.checkVariablesNotEmpty(workNameText, approachTimeText, restTimeText) {
        let userManager = UserDataManager.shared
    
        userManager.saveUserData(workName: workNameText, approachTime: approachTimeText, restTime: restTimeText)
                
            
            delegate?.refreshData()
          
            self.dismiss(animated: true)
        }
                
    }
    
}
