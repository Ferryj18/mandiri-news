//
//  HomeVC.swift
//  News
//
//  Created by Ferry jati on 31/12/23.
//

import UIKit
import Kingfisher

class HomeVC: UIViewController {
  
  
  
  
  @IBOutlet weak var imgTopHeadlines: UIImageView!
  
  
  @IBOutlet weak var vwHeadline: UIView!
  
  @IBOutlet weak var lblTitleHeadline: UILabel!
  
  
  @IBOutlet weak var lblAuthor: UILabel!
  
  @IBOutlet weak var lblDate: UILabel!

  
  
  
  @IBOutlet weak var vwTableAllNews: UITableView!
  
  
  @IBOutlet weak var labelNoData: UILabel!
    
    var presenter: VTPHomeProtocol?
    var key = "3e5dc3954955425db760b0361ae2d529"
    var dataArticle: [ArticleModel] = []
    var dataEverything: [AllArticleModel] = []
    var rowCount: Int? = 0
    var url: String?
    let currentDate = Date()
    override func viewDidLoad() {
        setUpView()
        setUpAction()
        setUpData()
        LoadingIndicator.startAnimating()
    }
    
    //MARK: - Function HomeView
    func setUpView(){
        labelNoData.isHidden = true
//
        vwHeadline.layer.cornerRadius = 20
        imgTopHeadlines.layer.cornerRadius = 20
        vwTableAllNews.register(HomeTVC.nib(), forCellReuseIdentifier: HomeTVC.identifier)
        vwTableAllNews.delegate = self
        vwTableAllNews.dataSource = self
        vwTableAllNews.rowHeight = UITableView.automaticDimension
        vwTableAllNews.estimatedRowHeight = 100
        
        
    }
    
    func setUpAction(){
        lblTitleHeadline.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(lblTitleTapped(_:)))
        lblTitleHeadline.addGestureRecognizer(tapGesture)
    }
    
    func setUpData(){
        let from = DateToString.shared.formatTodayDateToString(date: DateManipulator.decreaseDateByOneMonth(from: currentDate) ?? Date())
        let to = DateToString.shared.formatTodayDateToString(date: currentDate)
        presenter?.startGetTopHeadline(key: key)
        presenter?.startGetAllNews(key: key, from: from, to: to)
        
    }
    
    @objc func lblTitleTapped(_ gesture: UITapGestureRecognizer) {
        print("OK OK OK")
        print("label successfully clicked")
        if let navigation = navigationController{
//            presenter?.startNavToDetail(data: dataArticle, nav: navigation)
            presenter?.startGoToDetailWebVW(url: url ?? "", nav: navigation)
        }
    }
    
    
}

extension HomeVC: PTVHomeProtocol {
    func successGetTopHeadline(data: [ArticleModel]) {
        dataArticle = data
        let firstArticle = data[0]
                
        lblTitleHeadline.text = firstArticle.title
        lblAuthor.text = firstArticle.author
        lblDate.text = DateConverter.convertDateString(firstArticle.publishedAt)
        url = firstArticle.url
        if firstArticle.urlToImage == nil {
            imgTopHeadlines.isHidden = true
            labelNoData.isHidden = false
            labelNoData.text = "No Image Preview is Available"
        } else {
            labelNoData.isHidden = true
            imgTopHeadlines.kf.setImage(with: URL(string: firstArticle.urlToImage ?? ""))
            print(firstArticle.publishedAt)
        }
                
        
    }
    
    func successGetEverything(data: [AllArticleModel]) {
        dataEverything = data
        for _ in data {
            rowCount = (rowCount ?? 0)+1
        }
        vwTableAllNews.reloadData()
        print("success")
        LoadingIndicator.stopAnimating()
        
    }
    
    func failedGet(message: String) {
        print(message)
        Alert.showGeneralAlert(title: "Error", message: message, viewController: self)
        
    }
    

}

extension HomeVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowCount ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTVC.identifier, for: indexPath) as! HomeTVC
        cell.dataTo = dataEverything
        cell.parentViewController = self
        
        if rowCount == 0 {
            print("OK")
        }else {
            let dataDetail = dataEverything[indexPath.row]
            print(dataDetail.title)
            let dataCell = HomeTVCModel(
                title: dataDetail.title,
                author: dataDetail.author ?? "",
                date: dataDetail.publishedAt,
                image: dataDetail.urlToImage ?? "",
                url: dataDetail.url
            )
            cell.setUpData(dataCell: dataCell, index: indexPath.row)
        }
        return cell
    }
    
}

