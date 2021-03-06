SwiftPageMenu
===================================

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/hsylife/SwiftyPickerPopover)
[![CocoaPods](https://img.shields.io/cocoapods/dt/SwiftPageMenu.svg)](https://cocoapods.org/pods/SwiftPageMenu)

![1](https://raw.githubusercontent.com/tamanyan/SwiftPageMenu/master/screen_captures/1.gif)
![2](https://raw.githubusercontent.com/tamanyan/SwiftPageMenu/master/screen_captures/2.gif)
![3](https://raw.githubusercontent.com/tamanyan/SwiftPageMenu/master/screen_captures/3.gif)
![4](https://raw.githubusercontent.com/tamanyan/SwiftPageMenu/master/screen_captures/4.gif)


Customizable Page Menu ViewController in Swift

Features

- Infinite Page Menu
- Top / Bottom Position Menu
- Custom Color Menu
- Round Rect / Underline Page Cursor

This framework is reference by [msaps/Pageboy](https://github.com/msaps/Pageboy), [rechsteiner/Parchment](https://github.com/rechsteiner/Parchment), [EndouMari/TabPageViewController](https://github.com/EndouMari/TabPageViewController)

## Requirements

- iOS 10.0+
- Swift 4+

## How to use

### DataSource

SwiftPageMenu supports adding your own custom data sources.

```swift
@objc public protocol PageMenuControllerDataSource: class {
    /// The view controllers to display in the page menu view controller.
    func viewControllers(forPageMenuController pageMenuController: PageMenuController) -> [UIViewController]

    /// The view controllers to display in the page menu view controller.
    func menuTitles(forPageMenuController pageMenuController: PageMenuController) -> [String]

    /// The default page index to display in the page menu view controller.
    func defaultPageIndex(forPageMenuController pageMenuController: PageMenuController) -> Int
}
```

### Delegate

SwiftPageMenu give you the events below code.

```swift
@objc public protocol PageMenuControllerDelegate: class {
    /// The page view controller will begin scrolling to a new page.
    @objc optional func pageMenuController(_ pageMenuController: PageMenuController,
                                           willScrollToPageAtIndex index: Int,
                                           direction: PageMenuNavigationDirection)

    /// The page view controller scroll progress between pages.
    @objc optional func pageMenuController(_ pageMenuController: PageMenuController,
                                           fromIndex currentIndex: Int,
                                           toIndex nextIndex: Int,
                                           scrollingProgress progress: CGFloat,
                                           direction: PageMenuNavigationDirection)

    /// The page view controller did complete scroll to a new page.
    @objc optional func pageMenuController(_ pageMenuController: PageMenuController,
                                           didScrollToPageAtIndex index: Int,
                                           direction: PageMenuNavigationDirection)

    /// The menu item of page view controller are selected.
    @objc optional func pageMenuController(_ pageMenuController: PageMenuController,
                                           didSelectMenuItem index: Int,
                                           direction: PageMenuNavigationDirection)
}
```

### Customization

It is easy to customize SwiftPageMenu. All customization is handled by the PageMenuOptions protocol.
You can create own struct that conforms to this protocol.

```swift
import SwiftPageMenu

struct RoundRectPagerOption: PageMenuOptions {
    var isInfinite: Bool = false

    var tabMenuPosition: TabMenuPosition = .top

    var menuItemSize: PageMenuItemSize {
        return .sizeToFit(minWidth: 80, height: 30)
    }

    var menuTitleColor: UIColor {
        return .white
    }

    var menuTitleSelectedColor: UIColor = Theme.mainColor

    var menuCursorSelectedColor: UIColor = .white

    var menuCursor: PageMenuCursor {
      return .roundRect(rectColor: menuCursorSelectedColor, cornerRadius: 10, height: 22, borderWidth: nil, borderColor: nil)
    }

    var font: UIFont {
        return .systemFont(ofSize: UIFont.systemFontSize)
    }
    
    var selectedFont: UIFont {
      return UIFont.boldSystemFont(ofSize: UIFont.systemFontSize)
    }

    var menuItemMargin: CGFloat {
        return 8
    }

    var tabMenuBackgroundColor: UIColor {
        return UIColor(red: 3/255, green: 125/255, blue: 233/255, alpha: 1)
    }

    var tabMenuContentInset: UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4)
    }

    public init(isInfinite: Bool = false, tabMenuPosition: TabMenuPosition = .top) {
        self.isInfinite = isInfinite
        self.tabMenuPosition = tabMenuPosition
    }
}
```
It can change menuTitleSelectedColor and  menuCursorSelectedColor while you srolling to next or previous page. You can adding like this:

```swift
func pageMenuController(_ pageMenuController: PageMenuController, fromIndex currentIndex: Int, toIndex nextIndex: Int, scrollingProgress progress: CGFloat, direction: PageMenuNavigationDirection) {
  var index: Int
  if progress > 0.5 || progress < -0.5 {
    options.menuTitleSelectedColor = UIColor.red
    options.menuCursorSelectedColor = UIColor.black
  }
}
```
##### How to change the visible child view controller programmatically
SwiftPageMenu provides the following methods to programmatically change the visible child view controller:
```swift
public func moveToIndex(_ index: Int)
public func scrollToNext(animated: Bool, completion: ((Bool) -> Void)?)
public func scrollToPrevious(animated: Bool, completion: ((Bool) -> Void)?)
```

### CocoaPods

To integrate SwiftPageMenu into your Xcode project using CocoaPods, specify it in your Podfile:

```ruby
pod 'SwiftPageMenu'
```````

### Carthage

To integrate SwiftPageMenu into your Xcode project using Carthage, specify it in your Cartfile:

```ruby
github "tamanyan/SwiftPageMenu"
```````

## License

MIT license. See the LICENSE file for more info.
