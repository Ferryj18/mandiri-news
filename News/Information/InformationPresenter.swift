//
//  InformationPresenter.swift
//  News
//
//  Created by Ferry jati on 07/12/23.
//

import Foundation
import UIKit

class InformationPresenter: VTPInformation {
  var view: PTVInformation?
  
  var interactor: PTIInformation?
  
  var router: PTRInformation?
  
  func startLoadData() {
    
  }
  
  

}

extension InformationPresenter: ITPInformation{
  func onFailedLoadData(message: String) {
    
  }
  
  
}
