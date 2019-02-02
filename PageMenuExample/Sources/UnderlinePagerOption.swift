//
//  UnderlinePagerOption.swift
//  PageMenuExample
//
//  Created by Tamanyan on 3/10/17.
//  Copyright © 2017 Tamanyan. All rights reserved.
//

import Foundation
import SwiftPageMenu

struct UnderlinePagerOption: PageMenuOptions {

    var isInfinite: Bool = false

    var menuItemSize: PageMenuItemSize {
        return .sizeToFit(minWidth: 80, height: 30)
    }
    
    var menuTitleColor: UIColor {
        return UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1.0)
    }
    
    var menuTitleSelectedColor: UIColor = Theme.mainColor
  
    var menuCursorSelectedColor: UIColor = Theme.mainColor
    
    var menuCursor: PageMenuCursor {
      return .underline(barColor: menuCursorSelectedColor, height: 2, cornerRadius: 0)
    }

    var font: UIFont {
        return UIFont.systemFont(ofSize: UIFont.systemFontSize)
    }
  
    var selectedFont: UIFont {
      return UIFont.boldSystemFont(ofSize: UIFont.systemFontSize)
    }
    
    var menuItemMargin: CGFloat {
        return 8
    }
    
    var tabMenuBackgroundColor: UIColor {
        return .white
    }
    
    public init(isInfinite: Bool = false) {
        self.isInfinite = isInfinite
    }
}
