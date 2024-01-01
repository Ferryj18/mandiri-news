//
//  InformationProtocol.swift
//  News
//
//  Created by Ferry jati on 21/12/23.
//

import UIKit

protocol VTPInformationProtocol: AnyObject {
    var view: PTVInformationProtocol? { get set }
    var interactor: PTIInformationProtocol? { get set }
    var router: PTRInformationProtocol? { get set }
    
}

protocol PTVInformationProtocol: AnyObject {
    
}

protocol PTIInformationProtocol: AnyObject {
    var presenter: ITPInformationProtocol? { get set }

}

protocol ITPInformationProtocol: AnyObject {
    
}

protocol PTRInformationProtocol: AnyObject {
    static func createInformationModule() -> InformationVC
    
}
