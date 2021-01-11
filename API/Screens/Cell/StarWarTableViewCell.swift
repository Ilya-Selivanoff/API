//
//  StarWarTableViewCell.swift
//  API
//
//  Created by Илья Селиванов  on 10.01.2021.
//

import UIKit

class StarWarTableViewCell: UITableViewCell {

    @IBOutlet private weak var nameLabel: UILabel!
    
    // Set the identifier for the custom cell
    static let cellId = "starWarCellId"
    
    // Returning the xib file after instantiating it
    static var nib: UINib {
       return UINib(nibName: String(describing: self), bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with model: StarWarResult) {
        nameLabel.text = model.name
    }
    
}
