//
//  CustomCell.swift
//  DogBreeds
//
//  Created by Taylor Smith on 8/22/18.
//  Copyright © 2018 Taylor Smith. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    @IBOutlet weak var cellFrame: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
