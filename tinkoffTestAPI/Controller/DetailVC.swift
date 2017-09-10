//
//  DetailVC.swift
//  tinkoffTestAPI
//
//  Created by Vladimir Valter on 10/09/2017.
//  Copyright © 2017 Vladimir Valter. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {

    // Outlets
    @IBOutlet weak var textView: UITextView!

    private(set) public var content: String?

    //private(set) public var content = 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = content
    }

    func initContent(id: String) {
        NewsService.instance.getContent(withId: id) { (success) in
            if success {
                self.content = NewsService.instance.contentPayload?.content
            }
        }
      
    }

}
