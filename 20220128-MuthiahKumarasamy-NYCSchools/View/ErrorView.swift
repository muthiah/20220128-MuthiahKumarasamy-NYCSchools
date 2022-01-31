//
//  ErrorView.swift
//  20220128-MuthiahKumarasamy-NYCSchools
//
//  Created by Muthiah Kumarasamy on 1/30/22.
//


import UIKit

protocol ErrorDelegate: NSObject {
    func didTapRefresh()
}
class ErrorView: UIView {
    
    @IBOutlet weak var labelError: UILabel!

    weak var delegate :ErrorDelegate?
    
    static func showErrorView(text: String?) -> ErrorView? {
        guard let view = UINib(nibName: Constants.errorViewNibName, bundle: nil).instantiate(withOwner: self, options: nil)[0] as? ErrorView else {
            return nil
        }
        view.labelError.text = text
        return view
    }
        
    @IBAction func didTapRefresh(_ sender: UIButton) {
        self.delegate?.didTapRefresh()
    }
}
