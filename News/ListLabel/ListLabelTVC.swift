//
//  ListLabelTVC.swift
//  News
//
//  Created by Ferry jati on 22/12/23.
//

import UIKit

class ListLabelTVC: UITableViewCell {
  
  @IBOutlet weak var wrapView: UIView!
  @IBOutlet weak var imgNews: UIImageView!
  @IBOutlet weak var lblTitle: UILabel!
  @IBOutlet weak var lblAuthor: UILabel!
  
  static let identifier = "ListLabelTVC"
  static func nib() -> UINib {
      return UINib(nibName: identifier, bundle: nil)
  }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
      override func prepareForReuse() {
              super.prepareForReuse()
        lblTitle.text = ""
        lblAuthor.text = ""
        imgNews.image = nil
              
          
        // Configure the view for the selected state
    }
    
}
