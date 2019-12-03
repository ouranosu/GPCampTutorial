//
//  SideMenuRootSelect.swift
//  GPCampTutorial
//
//  Created by work on 2019/11/21.
//  Copyright © 2019 Masahiro Okura. All rights reserved.
//

import Foundation

enum SideMenuRootSelect: Int {
    
    case HomePage = 0
    case campAria = 1
    case rental = 2
    case caution = 3
    case questionnaire = 4
    case tutorial = 5

    var presentIdentifier: String{
        //viewConroller名を返す
        switch self{
        case .HomePage:
            return "HomePage"
        case .campAria:
            return "CampAria"
        case .rental:
            return "Rental"
        case .caution:
            return "Caution"
        case .questionnaire:
            return "Questionnaire"
        case .tutorial:
            return "Tutorial"
        }
    }
}
