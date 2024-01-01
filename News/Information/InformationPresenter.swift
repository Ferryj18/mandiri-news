//
//  InformationPresenter.swift
//  News
//
//  Created by Ferry jati on 07/12/23.
//

import Foundation
import UIKit

class InformationPresenter: VTPInformationProtocol {
    
    //MARK: - Property InformationPresenter
    var view: PTVInformationProtocol?
    var interactor: PTIInformationProtocol?
    var router: PTRInformationProtocol?
    var viewController : InformationVC!

    //MARK: - Lifecycle InformationPresenter
    init() {}
    
    init(viewController: InformationVC ) {
        self.viewController = viewController
    }
    
    //MARK: - Function InformationPresenter
    
    
}

    //MARK: - Extension InformationPresenter
extension  InformationPresenter : ITPInformationProtocol {

}
