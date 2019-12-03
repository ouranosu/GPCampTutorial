//
//  CampAriaRootSelect.swift
//  GPCampTutorial
//
//  Created by work on 2019/12/03.
//  Copyright © 2019 Masahiro Okura. All rights reserved.
//

import Foundation

enum CampAriaRootSelect: Int {
    
    case freeCamp = 0
    case autoCamp = 1
    case bbq = 2
    case kids = 3
    case wc = 4
    case staff = 5

    var presentIdentifier: String{
        //viewConroller名を返す
        switch self{
        case .freeCamp:
            return "FreeCamp"
        case .autoCamp:
            return "AutoCamp"
        case .bbq:
            return "Bbq"
        case .kids:
            return "Kids"
        case .wc:
            return "Wc"
        case .staff:
            return "Staff"
        }
    }
}
