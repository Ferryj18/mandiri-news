//
//  InformationWebPresenter.swift
//  News
//
//  Created by Ferry jati on 31/12/23.
//

import Foundation
import UIKit

class InformationWebPresenter: VTPInformationWebProtocol {
    
    //MARK: - Property InformationWebPresenter
    var view: PTVInformationWebProtocol?
    var interactor: PTIInformationWebProtocol?
    var router: PTRInformationWebProtocol?
    var viewController : InformationWebVC!

    //MARK: - Lifecycle InformationWebPresenter
    init() {}
    
    init(viewController: InformationWebVC ) {
        self.viewController = viewController
    }
    
    //MARK: - Function InformationWebPresenter
    
    
}

    //MARK: - Extension InformationWebPresenter
extension  InformationWebPresenter : ITPInformationWebProtocol {

}

