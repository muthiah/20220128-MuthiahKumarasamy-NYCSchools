//
//  NYCSchoolDetailViewController.swift
//  20220128-MuthiahKumarasamy-NYCSchools
//
//  Created by Muthiah Kumarasamy on 1/28/22.
//

import UIKit

class NYCSchoolDetailViewController: BaseViewController {

    var coordinator: NYCSchoolDetailCooridnator?
    var schoolDetailViewModel: NYCSchoolDetailViewModel?

    @IBOutlet weak var schoolDetailTableView: UITableView!

    func setViewModel(viewModel:NYCSchoolDetailViewModel?) {
        self.schoolDetailViewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = Constants.schoolDetailNavigationTitle
        registerNibs()
    }
    
    func registerNibs() {
        schoolDetailTableView.register(Constants.schoolDescriptionCellIndentifier)
        schoolDetailTableView.register(Constants.schoolCellIndentifier)
        schoolDetailTableView.register(Constants.schoolCellScoreIndentifier)
        schoolDetailTableView.registerHeaderFooter(Constants.schoolDescriptionHeaderIndentifier)
    }
    
    override func fetchData() {
        showActivityIndicator()
        schoolDetailViewModel?.getSchoolsDetails()
        schoolDetailViewModel?.reloadUI = { [weak self] in
            DispatchQueue.main.async {
                self?.hideActivityIndicator()
                self?.schoolDetailTableView.reloadData()
            }
        }
        
        schoolDetailViewModel?.showError = { [weak self] errorText in
            DispatchQueue.main.async {
                self?.hideActivityIndicator()
            }
        }
    }
}

extension NYCSchoolDetailViewController : UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return schoolDetailViewModel?.numberOfSections ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schoolDetailViewModel?.rowsPerSection ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = schoolDetailViewModel?.sections[indexPath.section]
        var tableViewCell: UITableViewCell?
        switch section {
            
        case .schoolInformation:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.schoolCellIndentifier, for: indexPath) as? NYCSchoolCell
            cell?.setDetailViewModel(viewModel: schoolDetailViewModel)
            cell?.delegate = self
            tableViewCell = cell
            break
        case .detail , .languages , .sports , .extraCuricularActivities:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.schoolDescriptionCellIndentifier, for: indexPath) as? NYCSchoolDescriptionCell
            cell?.setViewModel(viewModel: schoolDetailViewModel, index: indexPath.section)
            tableViewCell = cell
            break
        case .scores:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.schoolCellScoreIndentifier, for: indexPath) as? NYCSchoolScoreCell
            cell?.setViewModel(viewModel: schoolDetailViewModel)
            tableViewCell = cell
            break
        case .none:
            break
        }
        return tableViewCell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = tableView.dequeueReusableHeaderFooterView(withIdentifier: Constants.schoolDescriptionHeaderIndentifier) as! NYCDetailHeaderView
        headerCell.setViewModel(viewModel: schoolDetailViewModel, index: section)
        return headerCell

    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Constants.schoolDescriptionHeaderHeight
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNonzeroMagnitude
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
}

extension NYCSchoolDetailViewController: NYCSchoolCellDelegate {
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
