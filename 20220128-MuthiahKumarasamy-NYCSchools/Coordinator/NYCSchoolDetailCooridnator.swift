//
//  NYCSChoolDetailCoordinator.swift
//  20220128-MuthiahKumarasamy-NYCSchools
//
//  Created by Muthiah Kumarasamy on 1/30/22.
//

import Foundation

/// Coordinator for the NYCSchoolDetailViewController
///

class NYCSchoolDetailCooridnator: MainCoordinator {
    func start(passThoughData:NYCSchoolModel?) {
        let viewModel = NYCSchoolDetailViewModel(passThroughData: passThoughData)
        let vc = NYCSchoolDetailViewController.loadVCFromStoryBoard()
        vc.setViewModel(viewModel: viewModel)
        vc.coordinator = self
        navigationController?.pushViewController(vc, animated: true)
    }
}
