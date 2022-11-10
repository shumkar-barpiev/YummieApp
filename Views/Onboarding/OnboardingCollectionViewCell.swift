//
//  OnboardingCollectionViewCell.swift
//  Yummie
//
//  Created by User on 10/11/22.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    static let identifier = String(describing: OnboardingCollectionViewCell.self)
    
    @IBOutlet weak var slideTitleLabel: UILabel!
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideDescriptionLabel: UILabel!
    
    func setUp(_ slide: OnboardingSlide){
        slideTitleLabel.text = slide.title
        slideDescriptionLabel.text = slide.description
        slideImageView.image = slide.image
    }
}
