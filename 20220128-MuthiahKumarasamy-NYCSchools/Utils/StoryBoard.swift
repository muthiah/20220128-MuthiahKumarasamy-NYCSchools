//
//  StoryBoard.swift
//  20220128-MuthiahKumarasamy-NYCSchools
//
//  Created by Muthiah Kumarasamy on 1/29/22.
//

import UIKit

extension UIStoryboard {
    class func main() -> UIStoryboard {
        return UIStoryboard.init(name: "Main", bundle: nil)
    }
}

extension UIViewController {
    static func loadVCFromStoryBoard() -> Self {
        func instantiateFromStoryBoard<T: UIViewController>() -> T {
            return UIStoryboard.main().instantiateViewController(withIdentifier: String(describing: T.self)) as? T ?? UIViewController() as! T
        }
        return instantiateFromStoryBoard()
    }
}
