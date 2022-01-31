//
//  NYCSChoolDashboardCoordinator.swift
//  20220128-MuthiahKumarasamy-NYCSchools
//
//  Created by Muthiah Kumarasamy on 1/30/22.
//

import Foundation


/// Coordinator for the NYCSchoolDasboardViewController
/// 
class NYCSchoolDashboardCoordinator: MainCoordinator {
    
    var passThroughData: [NYCSchoolModel]?

    override func start() {
        let viewModel = NYCSchoolViewModel()
        let vc = NYCSchoolDasboardViewController.loadVCFromStoryBoard()
        vc.setViewModel(viewModel: viewModel)
        vc.coordinator = self
        navigationController?.pushViewController(vc, animated: false)
    }
    
    func coordianteToDetails(index:Int?) {
        if let index = index {
            let coordinator = NYCSchoolDetailCooridnator(navigationController: navigationController)
            coordinator.start(passThoughData: passThroughData?[index])
        }
    }
}

