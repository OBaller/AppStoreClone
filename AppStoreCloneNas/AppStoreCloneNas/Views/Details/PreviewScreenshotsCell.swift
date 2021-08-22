//
//  PreviewScreenshotsCell.swift
//  AppStoreCloneNas
//
//  Created by Decagon on 22/08/2021.
//

import UIKit

class PreviewScreenshotCell: UICollectionViewCell {
    
    let previewImage = UIImageView(cornerRadius: 12)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        previewImage.backgroundColor = .purple
        addSubview(previewImage)
        previewImage.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
