//
//  SplashScreenPresenter.swift
//  News
//
//  Created by Ferry jati on 01/01/24.
//

import Foundation
import UIKit

class SplashScreenPresenter: VTPSplashScreenProtocol{
    var view: PTVSplashScreenProtocol?
    
    var interactor: PTISplashScreenProtocol?
    
    var router: PTRSplashScreenProtocol?
    
    func gotoHome(nav: UINavigationController) {
        router?.pushToHome(nav: nav)
    }
    
    
}

extension SplashScreenPresenter: ITPSplashScreenProtocol{
    
}
