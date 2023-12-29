//
//  InformationProtocol.swift
//  News
//
//  Created by Ferry jati on 21/12/23.
//

import Foundation
import UIKit

protocol VTPInformation: AnyObject {
    var view: PTVInformation? {get set}
    var interactor: PTIInformation? {get set}
    var router: PTRInformation? {get set}
    
    func startLoadData()
    
}

protocol ITPInformation: AnyObject {
    
    func onFailedLoadData(message: String)
    
}

protocol PTVInformation: AnyObject {
    
    func FailedLoadData(message: String)
}

protocol PTIInformation: AnyObject {
    var presenter: ITPInformation? {get set}
    func fetchInformation()
    
    
    
}

protocol PTRInformation: AnyObject {
    static func createInformationModule() -> InformationVC
  
}
