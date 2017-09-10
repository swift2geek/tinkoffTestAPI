
//  ViewController.swift
//  tinkoffTestAPI
//
//  Created by Vladimir Valter on 09/09/2017.
//  Copyright © 2017 Vladimir Valter. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    // Outlets
    @IBOutlet weak var tableView: UITableView!

    var payload = [Payload]()
//    var id: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.addSubview(self.refreshControl)
        tableView.delegate = self
        tableView.dataSource = self
        NewsService.instance.getAllNews { (success) in
            if success {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }

    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:
            #selector(MainVC.handleRefresh(_:)),
                                 for: UIControlEvents.valueChanged)
        refreshControl.tintColor = UIColor.red

        return refreshControl
    }()

    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {

        let freshNews = NewsService.instance.getAllNews { (success) in
            if success {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            self.tableView.reloadData()
            refreshControl.endRefreshing()
        }
    }


    override func viewDidAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }

}

extension MainVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as? NewsCell {
            let payloads = NewsService.instance.payloads.sorted(by: { current, next in
                return current.publicationDate.milliseconds > next.publicationDate.milliseconds
            })
            let payload = payloads[indexPath.row]
            cell.configureCell(payload: payload)
            return cell
        } else {
            return UITableViewCell()

        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NewsService.instance.payloads.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("It works")
        let id = NewsService.instance.payloads[indexPath.row].id
        print(id)
        performSegue(withIdentifier: TO_DETAIL, sender: id)
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailsVC = segue.destination as? DetailVC {
            assert(sender as? String != nil)
            detailsVC.initContent(id: sender as! String)
        }
    }
}

