//
//  SplashScreenRouter.swift
//  News
//
//  Created by Ferry jati on 01/01/24.
//

import Foundation
import UIKit

class SplashScreenRouter: PTRSplashScreenProtocol{
    static func createModuleSplash() -> SplashScreenVC {
        let view = SplashScreenVC()
        let presenter = SplashScreenPresenter()
        let interactor: PTISplashScreenProtocol = SplashScreenInteractor()
        let router:PTRSplashScreenProtocol = SplashScreenRouter()
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        view.presenter = presenter
        
        return view
    }
    
    func pushToHome(nav: UINavigationController) {
        let vc = HomeRouter.createHomeModule()
        nav.pushViewController(vc, animated: true)
    }
    
    
}
