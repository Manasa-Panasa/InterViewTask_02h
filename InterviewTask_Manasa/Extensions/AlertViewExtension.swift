//
//  AlertViewExtension.swift
//  InterviewTask_Manasa
//
//  Created by Manasa Panasa on 30/11/23.
//

import Foundation
import UIKit
extension UIViewController {
    func showMessage(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .cancel))
        present(alertController, animated: true)
    }
}
