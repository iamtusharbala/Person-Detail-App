//
//  CustomDetailCell.swift
//  Task Detail App
//
//  Created by Coditas on 17/06/21.
//

import UIKit

class CustomDetailCell: UITableViewCell {
    
    @IBOutlet weak var avatarCellView: UIImageView!
    @IBOutlet weak var nameCellView: UILabel!
    @IBOutlet weak var emailCellView: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.avatarCellView.layer.cornerRadius = self.avatarCellView.frame.size.width / 2
        self.avatarCellView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
