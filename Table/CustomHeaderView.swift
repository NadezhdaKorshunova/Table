//
//  CustomHeaderView.swift
//  Table
//
//  Created by user on 17/11/2020.
//

import UIKit

protocol HeaderViewDelegate: class {
    func expandedSection(button: UIButton)
}

class CustomHeaderView: UITableViewHeaderFooterView {
    weak var delegate: HeaderViewDelegate?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var headerButton: UIButton!
    
    func configure(title: String, section: Int) {
            titleLabel.text = title
            headerButton.tag = section
        }
        
    func rotateImage(_ expanded: Bool) {
        if expanded {
            headerButton.imageView?.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        } else {
            headerButton.imageView?.transform = CGAffineTransform(rotationAngle: CGFloat.zero)
        }
    }
    
    @IBAction func tapHeader(_ sender: Any) {
        delegate?.expandedSection(button: sender as! UIButton)
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
