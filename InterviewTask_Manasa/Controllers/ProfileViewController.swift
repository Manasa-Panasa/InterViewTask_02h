//
//  ProfileViewController.swift
//  InterviewTask_Manasa
//
//  Created by Manasa Panasa on 30/11/23.
//

import UIKit
import GoogleSignIn

class ProfileViewController: UIViewController {

    @IBOutlet weak var nameTxf: UITextField!
    @IBOutlet weak var emailTxf: UITextField!
    @IBOutlet weak var pesonImgView: UIImageView!
    @IBOutlet weak var logoutBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
        self.displayData()
        
        if let imgURL = GoogleLoginResManager.shared.googleLoginResponse?.imageURL {
            self.loadImage(from: imgURL)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    func setUpUI(){
        pesonImgView.layer.cornerRadius = pesonImgView.frame.size.height/2
        logoutBtn.layer.cornerRadius = logoutBtn.frame.size.height/2
        self.title = "Profile"
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    func displayData(){
        nameTxf.text = GoogleLoginResManager.shared.googleLoginResponse?.name
        emailTxf.text = GoogleLoginResManager.shared.googleLoginResponse?.email
    }
    
    @IBAction func logoutBtn(_ sender: UIButton) {
        UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.email)
        GIDSignIn.sharedInstance().signOut()
        self.navigationController?.popToRootViewController(animated: true)
    }
    func loadImage(from imageURL: URL) {
        ImageRes.getImageFromUrl(url: imageURL, completion: { img in
            DispatchQueue.main.async {
                self.pesonImgView.image = img
            }
        })
    }
}
