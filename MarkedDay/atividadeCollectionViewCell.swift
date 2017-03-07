//
//  atividadeCollectionViewCell.swift
//  MarkedDay
//
//  Created by Student on 3/7/17.
//  Copyright © 2017 Fabiano Leite. All rights reserved.
//

import UIKit

class atividadeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var descricaoTextView: UITextView!
    
    var descricao: String? {
        get {
            return descricaoTextView.text
        }
        
        set {
            descricaoTextView?.text = newValue
        }
    }

    
}
