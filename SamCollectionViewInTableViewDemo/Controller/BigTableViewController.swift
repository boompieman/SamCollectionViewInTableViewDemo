//
//  ViewController.swift
//  SamCollectionViewInTableViewDemo
//
//  Created by MACBOOK on 2018/6/12.
//  Copyright © 2018年 MACBOOK. All rights reserved.
//

import UIKit

class BigTableViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!

    var smallCollectionViewControllers = [
        SmallCollectionViewController(),
        SmallCollectionViewController(),
        SmallCollectionViewController(),
        SmallCollectionViewController(),
        SmallCollectionViewController(),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        

    }

    func setupTableView() {
        let nib = UINib(nibName: String(describing: BigTableViewCell.self), bundle: nil)

        tableView.register(nib, forCellReuseIdentifier: String(describing: BigTableViewCell.self))

        tableView.dataSource = self

        tableView.delegate = self

        tableView.backgroundColor = UIColor.orange
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension BigTableViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return smallCollectionViewControllers.count

    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return 150
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let bigTableViewCell = tableView.dequeueReusableCell(
            withIdentifier: String(describing: BigTableViewCell.self),
            for: indexPath
            ) as! BigTableViewCell

        return bigTableViewCell
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let bigTableViewCell = cell as! BigTableViewCell

        self.smallCollectionViewControllers[indexPath.row].collectionView.frame = bigTableViewCell.bounds

        self.addChildViewController(self.smallCollectionViewControllers[indexPath.row])
        self.smallCollectionViewControllers[indexPath.row].didMove(toParentViewController: self)

        bigTableViewCell.addSubview(smallCollectionViewControllers[indexPath.row].view)
    }
}

