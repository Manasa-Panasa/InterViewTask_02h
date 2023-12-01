//
//  ShadowUIView.swift
//  InterviewTask_Manasa
//
//  Created by Manasa Panasa on 30/11/23.
//

import Foundation
import UIKit
extension UIView {
    func dropShadow() {
        self.layer.masksToBounds = false
        self.clipsToBounds = false
        self.layer.shadowColor = UIColor(red: 230, green: 230, blue: 230, alpha: 1).cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = 3
        self.backgroundColor = UIColor.lightGray
        
    }
}

extension UINavigationBar {
    
    func normalNavigationBar() {
        self.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(1.0), NSAttributedString.Key.font: 18]
        self.setBackgroundImage(nil, for: .default)
        self.shadowImage = nil
        self.isTranslucent = true
        
        if #available(iOS 15.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor(hex: "#7EC47B")
            appearance.shadowColor = .clear
            appearance.shadowImage = UIImage()
            appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            appearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            
            self.standardAppearance = appearance
            self.compactAppearance = appearance
            self.scrollEdgeAppearance = self.standardAppearance
        }
    }
}
extension UIColor {
    convenience init?(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        guard Scanner(string: hexSanitized).scanHexInt64(&rgb) else {
            return nil
        }

        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
