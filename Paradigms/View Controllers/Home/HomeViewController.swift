//
//  HomeViewController.swift
//  Paradigms
//
//  Created by Beverly Massengill on 11/12/19.
//  Copyright © 2019 BevTheDev. All rights reserved.
//

import UIKit

enum ExampleCells: Int, CaseIterable {
    case dates
    
    var title: String {
        switch self {
        case .dates:
            return "Dates"
        }
    }
}

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // MARK: - Properties
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        collectionView.register(cellType: ExampleCell.self)
    }
    
    // MARK: - CollectionView DataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ExampleCells.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: ExampleCell.self)
        cell.setUp(withTitle: ExampleCells.allCases[indexPath.item].title)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cellWidth = collectionView.frame.size.width/3
        let cellHeight = cellWidth
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    // MARK: - CollectionView Delegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch ExampleCells.allCases[indexPath.item] {
        case .dates: navigationController?.pushViewController(DateExamplesViewController(), animated: true)
        }
    }
}
