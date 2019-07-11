//
//  PersonTableViewCell.swift
//  MayTheForceBeWithHariel
//
//  Created by Hariel Giacomuzzi on 11/07/19.
//  Copyright © 2019 Giacomuzzi. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
    @IBOutlet var nameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configure(people: People) {
        self.nameLabel.text = people.name
    }
}
