//
//  DateTVCell.swift
//  CurrencyViewer
//
//  Created by Dmitrii Leksashov on 29/05/2019.
//  Copyright © 2019 Dmitrii Leksashov. All rights reserved.
//

import UIKit

class DateTVCell: UITableViewCell {
    @IBOutlet private var dateLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        dateLabel.text = nil
    }

    func configure(text: String) {
        dateLabel.text = text
    }
}
