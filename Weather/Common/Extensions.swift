//
//  Extensions.swift
//  Weather
//
//  Created by Savage on 7/9/21.
//

import Foundation
import UIKit
import MBProgressHUD
import DateToolsSwift

extension String{
    var isBlank: Bool{
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}

extension Date{

    var formattedDate: String{
        return "\(format(with: "HH:mm"))"
    }
}

extension UIViewController{
    
    //MARK: Display loading view and indicating view
    
    //MARK: Loading view -- hide manually
    func showLoadHUD(_ title: String? = nil){
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.label.text = title
    }
    
    func hideLoadHUD(){
        DispatchQueue.main.async {
            MBProgressHUD.hide(for: self.view, animated: true)
        }
    }
    
    
    //MARK: Reminder view -- hide automatically
    func showTextHUD(_ title: String, _ inCurrentView: Bool = true, _ subTitle: String? = nil){
        var viewToShow = view!
        if !inCurrentView{
            viewToShow = UIApplication.shared.windows.last!
        }
        let hud =  MBProgressHUD.showAdded(to: viewToShow, animated: true)
        hud.mode = .text //if this is not set, the view will display flower and below two line labels.
        hud.label.text = title
        hud.detailsLabel.text = subTitle
        hud.hide(animated: true, afterDelay: 2)
    }
    
    func hideKeyboardWhenTappedAround(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
}

