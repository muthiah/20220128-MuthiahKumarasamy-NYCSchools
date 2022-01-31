//
//  UITableView+Extension.swift
//  20220128-MuthiahKumarasamy-NYCSchools
//
//  Created by Muthiah Kumarasamy on 1/30/22.
//

import Foundation
import UIKit

extension UITableView {
    
    func registerHeaderFooter(_ nibName: String) {
        register(UINib.init(nibName: nibName, bundle: nil), forHeaderFooterViewReuseIdentifier: nibName)
    }
    
    func register(_ nibName: String) {
        register(UINib.init(nibName: nibName, bundle: nil), forCellReuseIdentifier: nibName)
    }
}
