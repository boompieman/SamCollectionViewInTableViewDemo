//
//  TableViewController.swift
//  SamCollectionViewInTableViewDemo
//
//  Created by MACBOOK on 2018/6/12.
//  Copyright © 2018年 MACBOOK. All rights reserved.
//

import Foundation
import UIKit

// 撈資料在這個controller，你可以設一個新的list，撈完後再根據自己的list去設定長度
class SmallCollectionViewController: UIViewController {

    let collectionView: UICollectionView

    private let layout: UICollectionViewFlowLayout

    override func viewDidLoad() {
        super.viewDidLoad()

        setupCollectionView()
    }

    init() {
        self.layout = UICollectionViewFlowLayout()

        self.layout.scrollDirection = .horizontal

        self.collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupCollectionView() {

        collectionView.delegate = self
        collectionView.dataSource = self

        collectionView.backgroundColor = UIColor.clear

        let nib = UINib(nibName: String(describing: SmallCollectionViewCell.self), bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: String(describing: SmallCollectionViewCell.self))

        view.addSubview(collectionView)
    }
}

extension SmallCollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return 5

    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: SmallCollectionViewCell.self), for: indexPath) as! SmallCollectionViewCell

        cell.indexLabel.text = String(indexPath.row)

        return cell
    }
}

extension SmallCollectionViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let itemSize = CGSize(width: 100, height: self.collectionView.frame.height)

        return itemSize
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

        return 10
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {

        return 10
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {

        return CGSize.zero
    }
}

