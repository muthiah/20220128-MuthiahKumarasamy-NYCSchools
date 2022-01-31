//
//  MainCoordinator.swift
//  20220128-MuthiahKumarasamy-NYCSchools
//
//  Created by Muthiah Kumarasamy on 1/29/22.
//

import UIKit


protocol Coordinator {
    var navigationController: UINavigationController? { get set }
    func start()
}

class MainCoordinator: Coordinator {
    
    weak var navigationController: UINavigationController?

    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }

    func start() {
        let coordinator = NYCSchoolDashboardCoordinator(navigationController: navigationController)
        coordinator.start()
    }
    
}
