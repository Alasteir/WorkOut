//
//  ItemTableViewCell.swift
//  WorkOut
//
//  Created by Alaster on 26.03.2024.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet weak var workOutName : UILabel!
    
    @IBOutlet weak var workOutTimeWorkAndRest : UILabel!
    
    @IBOutlet weak var switchEnableExercises: NSLayoutConstraint!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
