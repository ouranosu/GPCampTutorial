//
//  CautionViewController.swift
//  GPCampTutorial
//
//  Created by work on 2019/11/27.
//  Copyright © 2019 Masahiro Okura. All rights reserved.
//

import UIKit
import paper_onboarding

class CautionViewController: UIViewController {

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

extension CautionViewController: PaperOnboardingDataSource{
    
    func onboardingItemsCount() -> Int {
          return 4
    }
      
    func onboardingItem(at index: Int) -> OnboardingItemInfo {
          return[
            OnboardingItemInfo(informationImage: UIImage(named: "CampAria1")!,
                               title: "チェックアウトは鍵の返却だけ！",
                               description: "受付時にお渡しした鍵、またはナンバープレートを\nご返却いただくだけでチェックアウトは終了！\n煩わしい手続きは一切ありませんが、\n返却はお忘れなくお願いします。",
                               pageIcon: UIImage(named: "CampAria1")!,
                               color: UIColor.cyan,
                               titleColor: UIColor.black,
                               descriptionColor: UIColor.black,
                               titleFont: UIFont.systemFont(ofSize: 25),
                               descriptionFont: UIFont.systemFont(ofSize: 20)),
            
            OnboardingItemInfo(informationImage: UIImage(named: "CampAria2")!,
                               title: "直火は禁止",
                               description: "芝生保護のため、直火は禁止です。\n必ず焚き火台やバーベキューコンロをご使用ください。",
                               pageIcon: UIImage(named: "CampAria2")!,
                               color: UIColor.cyan,
                               titleColor: UIColor.black,
                               descriptionColor: UIColor.black,
                               titleFont: UIFont.systemFont(ofSize: 25),
                               descriptionFont: UIFont.systemFont(ofSize: 20)),
            
            OnboardingItemInfo(informationImage: UIImage(named: "CampAria3")!,
                               title: "車の乗入れ",
                               description: "フリーサイトエリアは車の乗入れは一切できません。\nバイクも入らないようにご注意ください。\nオートの方も可能であれば\n土の部分へのご駐車にご協力ください。",
                               pageIcon: UIImage(named: "CampAria3")!,
                               color: UIColor.cyan,
                               titleColor: UIColor.black,
                               descriptionColor: UIColor.black,
                               titleFont: UIFont.systemFont(ofSize: 25),
                               descriptionFont: UIFont.systemFont(ofSize: 20)),
            
            OnboardingItemInfo(informationImage: UIImage(named: "CampAria4")!,
                               title: "２２：００マナールール",
                               description: "バーベキューや花火、音響や強い照明などは２２：００で終了です。\n焚き火の前で静かに楽しんでいただくのは良いですが、お静かにしていただけない場合は退場をお願いすることもあります。",
                               pageIcon: UIImage(named: "CampAria4")!,
                               color: UIColor.cyan,
                               titleColor: UIColor.black,
                               descriptionColor: UIColor.black,
                               titleFont: UIFont.systemFont(ofSize: 25),
                               descriptionFont: UIFont.systemFont(ofSize: 20))
            
        ][index]
    }
}

extension CautionViewController: PaperOnboardingDelegate{
    func onboardingWillTransitonToIndex(_: Int) {
    }
}

