//
//  BaseViewModel.swift
//  20220128-MuthiahKumarasamy-NYCSchools
//
//  Created by Muthiah Kumarasamy on 1/29/22.
//

import UIKit

class BaseViewModel {
    /// Number of sections
    var numberOfSections: Int = 0
    /// Number of rows
    var rowsPerSection: Int = 0
    /// Reloading the UI of the View after the service call
    var reloadUI: (() -> Void)?
    /// Throwing  the Error to the View after the service call
    var showError: ((String) -> Void)?
}
