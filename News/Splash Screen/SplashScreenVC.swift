//
//  SplashScreen.swift
//  News
//
//  Created by Ferry jati on 01/01/24.
//

import UIKit

class SplashScreenVC: UIViewController {

    var presenter: VTPSplashScreenProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    func setupView(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            if let navigation = self.navigationController {
                self.presenter?.gotoHome(nav: navigation)
            }
        }
    }

}

extension SplashScreenVC: PTVSplashScreenProtocol{
    
}
