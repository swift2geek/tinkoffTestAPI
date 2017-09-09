//
//  NewsCell.swift
//  tinkoffTestAPI
//
//  Created by Vladimir Valter on 09/09/2017.
//  Copyright © 2017 Vladimir Valter. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {

// Outlets
    @IBOutlet weak var newsLbl: UILabel!


    func configureCell(payload: Payload) {
        let title = payload.text ?? ""
        newsLbl.text = title
    }

}
