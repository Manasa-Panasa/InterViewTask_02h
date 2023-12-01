//
//  myCollectionViewCell.swift
//  InterviewTask_Manasa
//
//  Created by Manasa Panasa on 30/11/23.
//

import UIKit
import SDWebImage

class myCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photoView: UIView!
    @IBOutlet weak var photoImgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        photoView.dropShadow()
        self.setUpUI()
    }
    
    func setUpUI(){
        photoView.layer.cornerRadius = 8
        photoImgView.layer.cornerRadius = 8
    }
    
    func loadImage(from imageURL: PhotosResponse) {
        if let url = URL(string: imageURL.downloadURL), !url.absoluteString.isEmpty {
//            ImageRes.getImageFromUrl(url: url, completion: { img in
//                DispatchQueue.main.async {
//                    self.photoImgView.image = img
//                }
//            })
            self.photoImgView.sd_setImage(with: url, completed: nil)
        }
    }
    
}
