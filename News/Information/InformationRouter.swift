//
//  InformationRouter.swift
//  News
//
//  Created by Ferry jati on 07/12/23.
//

import UIKit

class InformationRouter: PTRInformation {
  func pushToInformation(nav: UINavigationController) {
      let vc = InformationRouter.createInformationModule()
      vc.navigationItem.hidesBackButton = true
      nav.pushViewController(vc, animated: true)
  }
  static func createInformationModule() -> InformationVC {
    let view = InformationVC()
    let presenter = InformationPresenter()
    let interactor: PTIInformation = InformationInteractor()
    let router:PTRInformation = InformationRouter()
    
    presenter.view = view
    presenter.router = router
    presenter.interactor = interactor
    
    interactor.presenter = presenter
    view.presenter = presenter
    
    return view
  }
  

   
}
