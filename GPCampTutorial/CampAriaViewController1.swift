//
//  CampAriaViewController1.swift
//  GPCampTutorial
//
//  Created by work on 2019/11/26.
//  Copyright © 2019 Masahiro Okura. All rights reserved.
//

import UIKit

class CampAriaViewController1: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{

 
    @IBOutlet weak var collectionView: UICollectionView!
    //宣言
    let photo = ["collection1","collection2","collection3","collection4","collection5","collection6"]
    
    let label = ["フリーサイト","オートキャンプ","バーベキュー","遊具","トイレ","スタッフのオススメ"]
    let CellId = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //レイアウト調整
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        collectionView.collectionViewLayout = layout
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return label.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Mycell", for: indexPath)
        
        //画像
        let cellPhoto = cell.contentView.viewWithTag(1) as! UIImageView
        let photoImage = UIImage(named: photo[indexPath.row])
        cellPhoto.image = photoImage
        
        //タイトルラベル
        let cellTitlelabel = cell.contentView.viewWithTag(2) as! UILabel
        cellTitlelabel.text = label[indexPath.row]
        cellTitlelabel.lineBreakMode = .byCharWrapping

        cell.layer.cornerRadius = 20
        
        cell.layer.masksToBounds = false
        cell.layer.shadowOffset = CGSize(width: 2, height: 2)
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOpacity = 0.9
        cell.layer.shadowRadius = 5
        cell.backgroundColor = UIColor.cyan
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: CellId)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let horizontalSpace: CGFloat = 20
        let cellSize: CGFloat = self.view.bounds.width / 2 - horizontalSpace
        return CGSize(width: cellSize , height: cellSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        var viewController: UIViewController!
            
        switch indexPath.row{
        case 0:
            viewController = self.storyboard?.instantiateViewController(identifier: CampAriaRootSelect.freeCamp.presentIdentifier)
            viewController.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(viewController, animated: true)
        case 1:
            viewController = self.storyboard?.instantiateViewController(withIdentifier: CampAriaRootSelect.autoCamp.presentIdentifier)
            viewController.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(viewController, animated: true)
        case 2:
            viewController = self.storyboard?.instantiateViewController(withIdentifier: CampAriaRootSelect.bbq.presentIdentifier)
            viewController.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(viewController, animated: true)
        case 3:
            viewController = self.storyboard?.instantiateViewController(withIdentifier: CampAriaRootSelect.kids.presentIdentifier)
            viewController.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(viewController, animated: true)
        case 4:
            viewController = self.storyboard?.instantiateViewController(withIdentifier: CampAriaRootSelect.wc.presentIdentifier)
            viewController.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(viewController, animated: true)
        case 5:
            viewController = self.storyboard?.instantiateViewController(withIdentifier: CampAriaRootSelect.staff.presentIdentifier)
            viewController.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(viewController, animated: true)
        default:
            viewController = self.storyboard?.instantiateViewController(withIdentifier: CampAriaRootSelect.staff.presentIdentifier)
            viewController.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
