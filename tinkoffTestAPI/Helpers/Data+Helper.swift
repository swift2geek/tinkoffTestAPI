//
//  Data+Helper.swift
//  tinkoffTestAPI
//
//  Created by Vladimir Valter on 10/09/2017.
//  Copyright © 2017 Vladimir Valter. All rights reserved.
//

import UIKit


//MARK: Для рендеринга html

extension Data {
    var attributedString: NSAttributedString? {
        do {
            return try NSAttributedString(data: self, options:[.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            print(error)
        }
        return nil
    }
}
extension String {
    var data: Data {
        return Data(utf8)
    }
}
