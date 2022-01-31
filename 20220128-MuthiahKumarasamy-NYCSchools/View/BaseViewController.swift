//
//  BaseViewController.swift
//  20220128-MuthiahKumarasamy-NYCSchools
//
//  Created by Muthiah Kumarasamy on 1/29/22.
//

import UIKit

enum ErrorStyle {
    case alert
    case placeHolder
}

class BaseViewController: UIViewController  {
    
    /// Error View to display the placeholder
    var errorView:ErrorView?
    
    
    /// Loading view
    private var loadingView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .medium)
        view.color = .gray
        view.hidesWhenStopped = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    
    /// Fetching the data based on the View Logic
    func fetchData() {

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        view.addSubview(self.loadingView)
        NSLayoutConstraint.activate([
            self.loadingView.centerXAnchor.constraint(equalTo:view.centerXAnchor),
            self.loadingView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func showActivityIndicator() {
        loadingView.startAnimating()
    }
    
    func hideActivityIndicator(){
        loadingView.stopAnimating()
    }

    
    func showError(text: String, style: ErrorStyle) {
        switch style {
        case .alert:
            let alert = UIAlertController(title: Constants.errorHeading, message: text, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: Constants.ok, style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            break
        case .placeHolder:
               errorView?.removeFromSuperview()
            if let view =  ErrorView.showErrorView(text: text) {
                errorView = view
                errorView?.translatesAutoresizingMaskIntoConstraints = false;
                self.view.addSubview(view)
                view.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
                view.heightAnchor.constraint(equalToConstant: self.view.frame.height).isActive = true
                view.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
                view.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
                errorView?.delegate = self
            }
            break
        }
    }
}

extension BaseViewController : ErrorDelegate {
    
    func didTapRefresh() {
        errorView?.removeFromSuperview()
        fetchData()
    }
}

