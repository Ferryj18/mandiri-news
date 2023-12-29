//
//  HomeVC.swift
//  News
//
//  Created by Ferry jati on 07/12/23.
//

import Kingfisher
import UIKit

class HomeVC: UIViewController{
  
  
  @IBOutlet weak var navigationBar: UIView!
  @IBOutlet weak var imageMainNews: UIImageView!
  @IBOutlet weak var lblInformation: UILabel!
  @IBOutlet weak var tableViewNews: UITableView!
  @IBOutlet weak var btnReadNow: UIButton!
  
  var data: NewsResponse?
  var presenter : VTPHome?
  var dataNews: [NewsEntity] = []
  var cellNumb: Int?
  var url: [String] = []
  var author = ""
  var name = ""
  var isCanNext = true
  var isNext = false
  override func viewDidLoad() {
    super.viewDidLoad()
    setUpView()
    self.presenter?.startLoadData()
    setUpAction()
    
    
  }
  
  func setUpView(){
//    tableViewNews.register(ListLabelTVC.nib(), forCellReuseIdentifier: ListLabelTVC.identifier)
    tableViewNews.delegate = self
    tableViewNews.dataSource = self
    tableViewNews.allowsSelection = true
    tableViewNews.isScrollEnabled = true
    tableViewNews.rowHeight = UITableView.automaticDimension
    tableViewNews.register(ListLabelTVC.nib(), forCellReuseIdentifier: ListLabelTVC.identifier)
    tableViewNews.estimatedRowHeight = 200
    lblInformation.text = data?.name ?? ""
    
  }
  func setUpAction(){
    presenter?.startLoadData()
    btnReadNow.addTarget(self, action: #selector(goToDetail), for: .touchUpInside)
  }
  
  @objc func goToDetail(){
    print("Button Presed")
    if let navigation = navigationController{
      presenter?.startReadMore(nav: navigation)
    }
  }
}

extension HomeVC:  UITableViewDelegate, UITableViewDataSource{
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dataNews.count
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let row = indexPath.row
    
    let cell = tableView.dequeueReusableCell(withIdentifier: ListLabelTVC.identifier, for: indexPath) as! ListLabelTVC
    
    if let img = dataNews[row].urlToImage{
      let url = URL(string: "\(img)")
      cell.imgNews.kf.setImage(with: url)
    }
    
    cell.lblTitle.text = dataNews[row].title
    
    for i in 0..<dataNews[row].author.count{
      if i == 0{
        type = dataNews[row].author[i].title ?? ""
      }else{
        type = type + ", " + (dataNews[row].author[i].title ?? "")
      }
    }
    cell.lblAuthor.text = self.author
    
    
    return cell
  }
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableView.automaticDimension
  }
  
  func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableView.automaticDimension
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if let navigation = self.navigationController{
      self.presenter?.gotoInformation(data: dataNews[indexPath.row], nav: navigation)
    }
  }
  
}

  extension HomeVC: PTVHome{
    func successGet(data: [NewsEntity]) {
      dataNews = data
      print("Data OK: \(data)")
      for detail in data{
        
        print("//////////\(detail.urlToImage)")
//        if let img = detail.urlToImage{
//          print(img)
        let url = URL(string: "\(detail.urlToImage ?? "")")
          print(url)
        imageMainNews.kf.setImage(with: url)
//          imageMainNews.kf.setImage(with: url )
        
      }
    }
    
    func FailedLoadData(message: String) {
      
    }
}


