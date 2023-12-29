//
//  HomeRouter.swift
//  News
//
//  Created by Ferry jati on 07/12/23.
//

import Foundation
import UIKit

class HomeRouter: PTRHome {
  static func createHomeModule() -> HomeVC {
    let view = HomeVC()
    let presenter = HomePresenter()
    let interactor: PTIHome = HomeInteractor()
    let router: PTRHome = HomeRouter()
    
    presenter.view = view
    presenter.router = router
    presenter.interactor = interactor
    
    interactor.presenter = presenter
    view.presenter = presenter
    
    return view
  }
  func pushToInformation(nav: UINavigationController) {
      let vc = InformationRouter.createInformationModule()
      vc.navigationItem.hidesBackButton = true
      nav.pushViewController(vc, animated: true)
    print("Button PRessed 3")
  }
  

   
}
