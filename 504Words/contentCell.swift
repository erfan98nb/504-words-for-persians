//
//  contentCell.swift
//  504Words
//
//  Created by MAC os on 2/1/21.
//

import UIKit

class contentCell: UITableViewCell {

    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var Word: UILabel!
    @IBOutlet weak var meaning: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
