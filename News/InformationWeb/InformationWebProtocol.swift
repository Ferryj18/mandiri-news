//
//  InformationWebProtocol.swift
//  News
//
//  Created by Ferry jati on 31/12/23.
//

import UIKit

protocol VTPInformationWebProtocol: AnyObject {
    var view: PTVInformationWebProtocol? { get set }
    var interactor: PTIInformationWebProtocol? { get set }
    var router: PTRInformationWebProtocol? { get set }
    
}

protocol PTVInformationWebProtocol: AnyObject {
    
}

protocol PTIInformationWebProtocol: AnyObject {
    var presenter: ITPInformationWebProtocol? { get set }

}

protocol ITPInformationWebProtocol: AnyObject {
    
}

protocol PTRInformationWebProtocol: AnyObject {
    static func createInformationWebModule() -> InformationWebVC
    
}
