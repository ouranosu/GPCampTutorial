//
//  SideMenuViewController.swift
//  GPCampTutorial
//
//  Created by work on 2019/11/20.
//  Copyright © 2019 Masahiro Okura. All rights reserved.
//

import UIKit

class SideMenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //Outlet
    
    @IBOutlet weak var TableView: UITableView!
    
    private let photo = ["sideMenu1", "sideMenu2", "sideMenu3", "sideMenu4", "sideMenu5", "sideMenu6"]
    private let label = ["公式HP", "場内案内", "レンタル", "注意事項","アンケートのお願い", "チュートリアルを見る"]
    private let CellId = "sideMenuCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //セルの数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photo.count
    }
    
    //カスタムセルの再利用表示
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

       let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "SideMenuCell", for: indexPath)

       //画像
       let cellImageView = cell.contentView.viewWithTag(1) as! UIImageView
       let cellImage = UIImage(named: photo[indexPath.row])
       cellImageView.image = cellImage
       //商品名
       let cellNameLabel = cell.contentView.viewWithTag(2) as! UILabel
       cellNameLabel.text = label[indexPath.row]
       
       tableView.register(UITableViewCell.self, forCellReuseIdentifier: CellId)
       
       return cell
        
    }
    
    //セルの高さ調整
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cusHeight : CGFloat
        cusHeight = TableView.frame.height/6
        return CGFloat(cusHeight)
    }
    
    //セル選択時のアクション
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var storyBoard: UIStoryboard!
        var viewController: UIViewController!
        
        switch indexPath.row{
        case 0:
            storyBoard = UIStoryboard(name: SideMenuRootSelect.HomePage.presentIdentifier, bundle: nil)
            viewController = storyBoard.instantiateViewController(withIdentifier: SideMenuRootSelect.HomePage.presentIdentifier)
            viewController.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(viewController, animated: true)
        case 1:
            storyBoard = UIStoryboard(name: SideMenuRootSelect.campAria.presentIdentifier, bundle: nil)
            viewController = storyBoard.instantiateViewController(withIdentifier: SideMenuRootSelect.campAria.presentIdentifier)
            viewController.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(viewController, animated: true)
        case 2:
            storyBoard = UIStoryboard(name: SideMenuRootSelect.rental.presentIdentifier, bundle: nil)
            viewController = storyBoard.instantiateViewController(withIdentifier: SideMenuRootSelect.rental.presentIdentifier)
            viewController.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(viewController, animated: true)
        case 3:
            storyBoard = UIStoryboard(name: SideMenuRootSelect.caution.presentIdentifier, bundle: nil)
            viewController = storyBoard.instantiateViewController(withIdentifier: SideMenuRootSelect.caution.presentIdentifier)
            viewController.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(viewController, animated: true)
        case 4:
            storyBoard = UIStoryboard(name: SideMenuRootSelect.questionnaire.presentIdentifier, bundle: nil)
            viewController = storyBoard.instantiateViewController(withIdentifier: SideMenuRootSelect.questionnaire.presentIdentifier)
            viewController.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(viewController, animated: true)
        case 5:
            storyBoard = UIStoryboard(name: SideMenuRootSelect.tutorial.presentIdentifier, bundle: nil)
            viewController = storyBoard.instantiateViewController(withIdentifier: SideMenuRootSelect.tutorial.presentIdentifier)
            viewController.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(viewController, animated: true)
        default:
            storyBoard = UIStoryboard(name: SideMenuRootSelect.tutorial.presentIdentifier, bundle: nil)
            viewController = storyBoard.instantiateViewController(withIdentifier: SideMenuRootSelect.tutorial.presentIdentifier)
            viewController.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.alpha = 0
        //セルのアニメーション表示　だんだん出てくる
        UIView.animate(withDuration: 0.5,
                       delay: 0.1 * Double(indexPath.row),
                       animations: {
                        cell.alpha = 1
                        }
        )
    }
}
