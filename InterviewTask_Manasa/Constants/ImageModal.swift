//
//  ImageModal.swift
//  InterviewTask_Manasa
//
//  Created by Manasa Panasa on 30/11/23.
//

import Foundation
import UIKit

struct ImageRes {
    static func getImageFromUrl(url: URL, completion: @escaping (UIImage?) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                print("Error fetching image: \(error?.localizedDescription ?? "Unknown error")")
                completion(nil)
                return
            }
            
            if let image = UIImage(data: data) {
                completion(image)
            } else {
                print("Error converting data to image")
                completion(nil)
            }
        }
        
        task.resume()
    }
}
