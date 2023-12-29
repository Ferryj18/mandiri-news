//
//  InformationVC.swift
//  News
//
//  Created by Ferry jati on 07/12/23.
//

import UIKit
import Kingfisher
class InformationVC: UIViewController {
  
  
  @IBOutlet weak var navigationBar: UIView!
  
  @IBOutlet weak var headerTitle: UILabel!
  
  @IBOutlet weak var imageNews: UIImageView!
  
  @IBOutlet weak var lblInformation: UILabel!
  
  
  var presenter : VTPInformation?
  var dataNews: [NewsResponse] = []
  var cellNumb: Int?
  var url = ""
  var type = ""
  var isCanNext = true
  var isNext = false
  var name = ""
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setUpView()
    setUpAction()
    
  }
  
  func setUpView(){
  }
  func setUpAction(){
  }
  
}
  
  extension InformationVC: PTVInformation{
    func FailedLoadData(message: String) {
      
    }
  }
