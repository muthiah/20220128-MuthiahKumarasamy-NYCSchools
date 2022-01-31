//
//  NYCSchoolDasboardViewController.swift
//  20220128-MuthiahKumarasamy-NYCSchools
//
//  Created by Muthiah Kumarasamy on 1/28/22.
//

import UIKit

class NYCSchoolDasboardViewController: BaseViewController  {
    
    var coordinator: NYCSchoolDashboardCoordinator?
    var viewModel: NYCSchoolViewModel?

    @IBOutlet weak var schoolTableView: UITableView!
    
    func setViewModel(viewModel: NYCSchoolViewModel?) {
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = Constants.schoolDashboardNavigationTitle
        schoolTableView.register(Constants.schoolCellIndentifier)
    }
    
    override func fetchData() {
        
        showActivityIndicator()
        viewModel?.getSchools()
        
        viewModel?.reloadUI = { [weak self] in
            DispatchQueue.main.async {
                self?.hideActivityIndicator()
                self?.coordinator?.passThroughData = self?.viewModel?.schoolModels
                
                self?.schoolTableView.reloadData()
            }
        }
        
        viewModel?.showError = { [weak self] errorText in
            DispatchQueue.main.async {
                self?.hideActivityIndicator()
                self?.showError(text: errorText, style: .placeHolder)
            }
        }
    }
    
}

extension NYCSchoolDasboardViewController : UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.numberOfSections ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.rowsPerSection ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.schoolCellIndentifier, for: indexPath) as? NYCSchoolCell else { return UITableViewCell()}
        cell.setViewModel(viewModel: viewModel, index: indexPath.row)
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        self.coordinator?.coordianteToDetails(index: indexPath.row)
    }
    
}

extension NYCSchoolDasboardViewController: NYCSchoolCellDelegate {
    func didTapPhoneNumber(phoneNumber: String?) {
        if let phoneNumber = phoneNumber , let url = URL(string: "tel://\(phoneNumber)") {
           let application = UIApplication.shared
           if (application.canOpenURL(url)) {
               application.open(url, options: [:], completionHandler: nil)
           }
            else {
                showError(text: Constants.phoneNumberInvalidError, style: .alert)
            }
         }
    }
}
