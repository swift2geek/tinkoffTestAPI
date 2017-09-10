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

    var content: String? {
        didSet {
            if oldValue != content {
                DispatchQueue.main.async {
                    self.initHtmlText()
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSLog("\(content)")
        initHtmlText()
    }


    func initContent(id: String) {
        NewsService.instance.getContent(withId: id) { (success) in
            if success {
                self.content = NewsService.instance.contentPayload?.content
            } else {
                fatalError()
            }
        }
      
    }

    func initHtmlText() {
        let style = NSMutableParagraphStyle()
        style.paragraphSpacing = 13
        style.lineHeightMultiple = 1.41
        let textAttributes: [String : Any] = [
            NSAttributedStringKey.foregroundColor.rawValue: UIColor.black]

        if let text = content {

            do {
                let attributedString = try NSAttributedString(data: text.data, options:[.documentType: NSAttributedString.DocumentType.html,
                                                                                        .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
                textView.linkTextAttributes = textAttributes
                textView.attributedText = attributedString
            } catch {
                print(error)
            }
        }
    }

    @IBAction func swipeBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
