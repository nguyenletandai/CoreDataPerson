//
//  TableViewCell.swift
//  CoreDataPerson
//
//  Created by daicudu on 1/21/19.
//  Copyright © 2019 daicudu. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var avartarImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func prepareForReuse() {
        nameLabel.text = ""
        ageLabel.text = ""
        avartarImage.image = .none
    }

}
