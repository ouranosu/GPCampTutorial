//
//  TutorialViewController.swift
//  PaperOnBoardTest
//
//  Created by work on 2019/11/19.
//  Copyright © 2019 Masahiro Okura. All rights reserved.
//

import UIKit
import paper_onboarding

class TutorialViewController: UIViewController {
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let onboarding = PaperOnboarding()
        onboarding.dataSource = self
        onboarding.delegate = self
        onboarding.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(onboarding)
        
        //add constraints
        for attribute: NSLayoutConstraint.Attribute in [.left, .right, .top, .bottom]{
            let constraint = NSLayoutConstraint(item: onboarding,
                                                attribute: attribute,
                                                relatedBy: .equal,
                                                toItem: view,
                                                attribute: attribute,
                                                multiplier: 1,
                                                constant: 0)
            view.addConstraint(constraint)
        }
    }
}

extension TutorialViewController: PaperOnboardingDataSource{
    
    func onboardingItemsCount() -> Int {
          return 3
    }
      
    func onboardingItem(at index: Int) -> OnboardingItemInfo {
          return[
            OnboardingItemInfo(informationImage: UIImage(named: "tutorial1")!,
                               title: "ゴミはゴミステーションへ",
                               description: "出たゴミはゴミステーションへ。\n分別を必ず行ってください。\nガス缶は穴を開けるなど、\n必要な処置は確実にお願いします。",
                               pageIcon: UIImage(named: "tutorial1")!,
                               color: UIColor.cyan,
                               titleColor: UIColor.black,
                               descriptionColor: UIColor.black,
                               titleFont: UIFont.systemFont(ofSize: 25),
                               descriptionFont: UIFont.systemFont(ofSize: 20)),
            
            OnboardingItemInfo(informationImage: UIImage(named: "tutorial2")!,
                               title: "入浴施設『美肌の湯』は２１：３０まで",
                               description: "お風呂の受付は２１：３０までです。\n繁忙期は１９時以降から非常に混み合うため、\n早めに入ることを強くオススメします。",
                               pageIcon: UIImage(named: "tutorial2")!,
                               color: UIColor.cyan,
                               titleColor: UIColor.black,
                               descriptionColor: UIColor.black,
                               titleFont: UIFont.systemFont(ofSize: 25),
                               descriptionFont: UIFont.systemFont(ofSize: 20)),
            
            OnboardingItemInfo(informationImage: UIImage(named: "tutorial3")!,
                               title: "２２時以降はサイレントタイム",
                               description: "仲間と集まって楽しい時間\nでも２２時以降はお静かに。",
                               pageIcon: UIImage(named: "tutorial3")!,
                               color: UIColor.cyan,
                               titleColor: UIColor.black,
                               descriptionColor: UIColor.black,
                               titleFont: UIFont.systemFont(ofSize: 25),
                               descriptionFont: UIFont.systemFont(ofSize: 20))
            
        ][index]
    }
}

extension TutorialViewController: PaperOnboardingDelegate{
    func onboardingWillTransitonToIndex(_: Int) {
        
    }
    
    func onboardingDidTransitonToIndex(_ index: Int) {
        if index == 2 {
            let button = UIButton(type: .system)
            button.setTitle("閉じる", for: .normal)
            button.frame = CGRect(x: view.frame.maxX - 80 , y: view.frame.minY + 40, width: 80, height: 40)
            button.backgroundColor = .clear
            button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
            self.view.addSubview(button)
            button.addTarget(self, action: #selector(self.event(_:)), for: UIControl.Event.touchUpInside)
        }
    }
    @objc func event(_ sender: UIButton){
        let Storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = Storyboard.instantiateViewController(withIdentifier: "Main")
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true, completion: nil)
    }
}
