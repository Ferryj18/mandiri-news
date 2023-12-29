//
//  HomePresenter.swift
//  News
//
//  Created by Ferry jati on 07/12/23.
//

import Foundation
import UIKit

class HomePresenter: VTPHome {
  var view: PTVHome?
  var interactor: PTIHome?
  var router: PTRHome?
  
  func startLoadData() {
    interactor?.fetchHome()
  }
  func startReadMore(nav: UINavigationController){
    print("Button Pressed 2")
    router?.pushToInformation(nav: nav)
    
  }
}

extension HomePresenter: ITPHome{
  func onSuccessGet(data: [NewsEntity]) {
    view?.successGet(data: data)
  }
  
  func onFailedLoadData(message: String) {
    view?.FailedLoadData(message: message)
  }
  
  
}
