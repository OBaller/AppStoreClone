//
//  AppsHeaderCell.swift
//  AppStoreCloneNas
//
//  Created by Decagon on 15/08/2021.
//

import UIKit

class AppsHeaderCell: UICollectionViewCell {
    
    let companyLabel = UILabel(text: "Facebook", font: .boldSystemFont(ofSize: 12))
    let descriptionlabel = UILabel(text: "Keeping up with friends is faster than ever", font: .systemFont(ofSize: 23))
    
    let headerImage = UIImageView(cornerRadius: 8)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        companyLabel.textColor = .blue
        headerImage.backgroundColor = .red
        descriptionlabel.numberOfLines = 2
        
        let stackView = VerticalStackView(arrangedSubviews: [
        companyLabel,
        descriptionlabel,
        headerImage
        ], spacing: 12)
        
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 16, left: 0, bottom: 0, right: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
