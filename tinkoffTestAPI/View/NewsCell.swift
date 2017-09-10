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

        let textAttributes: [String : Any] = [
            NSAttributedStringKey.foregroundColor.rawValue: UIColor.black]

        do {
            let attributedString = try NSAttributedString(data: title.data, options:[.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
            newsLbl.attributedText = attributedString
        } catch {
            print(error)
        }
    }
}
