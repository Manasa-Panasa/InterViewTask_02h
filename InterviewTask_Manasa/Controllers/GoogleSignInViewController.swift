//
//  ViewController.swift
//  InterviewTask_Manasa
//
//  Created by Manasa Panasa on 30/11/23.
//

import UIKit
import GoogleSignIn

class GoogleSignInViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if UserDefaults.standard.object(forKey: UserDefaultsKeys.email) is String {
            self.goToNextScreen()
        }else{
            self.setUpGoogleSignInBtn()
        }
    }
    
    func setUpGoogleSignInBtn() {
        GIDSignIn.sharedInstance().signOut()
        GIDSignIn.sharedInstance().clientID = Constants.google_ClientId
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        
        let signInButton = GIDSignInButton(frame: CGRect(x: 0, y: 0, width: 200, height: 80))
        signInButton.center = view.center
        signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        view.addSubview(signInButton)
    }
}
extension GoogleSignInViewController:GIDSignInDelegate,GIDSignInUIDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            self.showMessage(title: "Failed", message: "\(error.localizedDescription)")
            
        } else {
            if user != nil {
                let response = GoogleLoginResponse(userID: user.userID, name: user.profile.name, email: user.profile.email, imageURL: user.profile.imageURL(withDimension: 200))
                GoogleLoginResManager.shared.googleLoginResponse = response
                if GoogleLoginResManager.shared.googleLoginResponse?.email != "" {
                    UserDefaults.standard.set(GoogleLoginResManager.shared.googleLoginResponse?.email, forKey: UserDefaultsKeys.email)
                    self.goToNextScreen()
                }
            }else{
                self.showMessage(title: "Failed", message: "\(error.localizedDescription)")
            }
        }
    }
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
    }
    
    @objc func signInButtonTapped() {
        GIDSignIn.sharedInstance().signIn()
    }
    
    func goToNextScreen(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ListOfImagesViewController") as! ListOfImagesViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
