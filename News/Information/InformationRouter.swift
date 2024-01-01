//
//  InformationRouter.swift
//  News
//
//  Created by Ferry jati on 07/12/23.
//

import UIKit

class InformationRouter: PTRInformationProtocol {
    //MARK: - Function InformationRouter
    static func createInformationModule() -> InformationVC {
        let view =  InformationVC()
        let presenter =  InformationPresenter(viewController: view)
        let interactor : PTIInformationProtocol =  InformationInteractor()
        let router : PTRInformationProtocol =  InformationRouter()
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        view.presenter = presenter
        return view
    }
    
}
