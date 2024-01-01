//
//  HomeRouter.swift
//  News
//
//  Created by Ferry jati on 07/12/23.
//

import UIKit

class HomeRouter: PTRHomeProtocol {
    static func createHomeModule() -> HomeVC {
        let view =  HomeVC()
        let presenter =  HomePresenter(viewController: view)
        let interactor : PTIHomeProtocol =  HomeInteractor()
        let router : PTRHomeProtocol =  HomeRouter()
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        view.presenter = presenter
        return view
    }
    
    func navToDetail(data: [ArticleModel], nav: UINavigationController) {
        let vw = InformationRouter.createInformationModule()
        vw.dataNews = data
        vw.navFrom = .TopHeadline
        nav.pushViewController(vw, animated: true)
    }
    
    func navToDetailFromCell(data: [AllArticleModel], index: Int, nav: UINavigationController) {
        print("Succes to Router")
        let vw = InformationRouter.createInformationModule()
        vw.dataAllNews = data
        vw.indexNumb = index
        vw.navFrom = .AllHeadline
        nav.pushViewController(vw, animated: true)
    }
    
    func goToDetailWebVW(url: String, nav: UINavigationController) {
        let vw = InformationWebRouter.createInformationWebModule()
        vw.url = url
        nav.pushViewController(vw, animated: true)
    }
    
    
}

    

