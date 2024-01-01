//
//  InformationWebRouter.swift
//  News
//
//  Created by Ferry jati on 31/12/23.
//

import UIKit

class InformationWebRouter: PTRInformationWebProtocol {
    
    //MARK: - Property InformationWebRouter
    

    //MARK: - Lifecycle InformationWebRouter
    
    
    //MARK: - Function InformationWebRouter
    static func createInformationWebModule() -> InformationWebVC {
        let view =  InformationWebVC()
        let presenter =  InformationWebPresenter(viewController: view)
        let interactor : PTIInformationWebProtocol =  InformationWebInteractor()
        let router : PTRInformationWebProtocol =  InformationWebRouter()
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        view.presenter = presenter
        return view
    }
    
}

