//
//  PreviewCell.swift
//  AppStoreCloneNas
//
//  Created by Decagon on 22/08/2021.
//

import UIKit

class PreviewCell: UICollectionViewCell {
    let horizontalController = PreviewScreenshotsController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//backgroundColor = .red
        addSubview(horizontalController.view)
        horizontalController.view.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
