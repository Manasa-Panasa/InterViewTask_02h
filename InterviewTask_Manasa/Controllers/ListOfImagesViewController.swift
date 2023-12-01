//
//  ListOfImagesViewController.swift
//  InterviewTask_Manasa
//
//  Created by Manasa Panasa on 30/11/23.
//

import UIKit

class ListOfImagesViewController: UIViewController {

    @IBOutlet weak var myCollectionView: UICollectionView!
    
    var photosArrModal:[PhotosResponse] = []
    var currentPage = 1
    var isFetching = false
    var hasMoreData = true
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.fetchPhotosDataFromAPI()
    }
    func setUpUI() {
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        
        self.title = "Gallery"
        self.navigationItem.hidesBackButton = true
        self.navigationController?.navigationBar.normalNavigationBar()
        
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height - scrollView.frame.size.height
        
        if offsetY > contentHeight && !isFetching && hasMoreData {
            currentPage += 1
            fetchPhotosDataFromAPI()
        }
    }
    func fetchPhotosDataFromAPI() {
        isFetching = true
        let urlString = "\(APIURLs.photosURL)\(currentPage)&limit=10"
        getUrl(urlString: urlString) { (result: Result<[PhotosResponse], NetworkError>) in
            switch result {
            case .success(let data):
                print("Received data: \(data)")
                DispatchQueue.main.async {
                    self.photosArrModal += data
                    self.myCollectionView.reloadData()
                    self.isFetching = false
                }
            case .failure(let error):
                print("Error: \(error)")
                self.isFetching = false
            }
        }
    }
    @IBAction func profileBarBtnAction(_ sender: UIBarButtonItem) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
extension ListOfImagesViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photosArrModal.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! myCollectionViewCell
        let modal = photosArrModal[indexPath.row]
        cell.loadImage(from: modal)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       return CGSize(width:myCollectionView.frame.width/2, height: myCollectionView.frame.width/2)
        
    }
  
}



