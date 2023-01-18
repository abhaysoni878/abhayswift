//
//  SearchViewController.swift
//  AbhaySoni
//
//  Created by bizbrolly on 06/12/21.
//

import UIKit
class SearchViewController: UIViewController, UISearchBarDelegate{
    //MARK: outlets
    @IBOutlet weak var top_image: UIImageView!
    
    @IBOutlet weak var mid_view: UIView!
    
    @IBOutlet weak var search: UISearchBar!
    
    @IBOutlet weak var submit_btn: UIButton!
    
    @IBOutlet weak var backbutton: UIButton!
    @IBOutlet weak var mycollectionView: UICollectionView!
    //MARK: variables
    var ImageDemo :[[String:Any]] = [["Name":"Abhay soni","Image1":#imageLiteral(resourceName: "white_love"),"Image2": #imageLiteral(resourceName: "Image-2"),"Title":"Just Now","Image":#imageLiteral(resourceName: "girl_image") ],["Name":"raj Soni","Image1":#imageLiteral(resourceName: "white_love"),"Image2": #imageLiteral(resourceName: "Image-6"),"Title":"Just Now","Image":#imageLiteral(resourceName: "download (5)")],["Name":"Abhayr","Image1":#imageLiteral(resourceName: "white_love"),"Image2": #imageLiteral(resourceName: "Image-4"),"Title":"Just Now","Image":#imageLiteral(resourceName: "images")],["Name":"Adity Soni","Image1":#imageLiteral(resourceName: "white_love"),"Image2": #imageLiteral(resourceName: "Image-7"),"Title":"Just Now","Image":#imageLiteral(resourceName: "swami-vivekananda-inspire-wallpapers-download-21v1")],["Name":"Somu","Image1":#imageLiteral(resourceName: "white_love"),"Image2": #imageLiteral(resourceName: "Image-7"),"Title":"Just Now","Image":#imageLiteral(resourceName: "images")],["Name":"Raghav s","Image1":#imageLiteral(resourceName: "white_love"),"Image2": #imageLiteral(resourceName: "cotact"),"Title":"Just Now","Image":#imageLiteral(resourceName: "download (5)")],["Name":"Raghav k","Image1":#imageLiteral(resourceName: "white_love"),"Image2": #imageLiteral(resourceName: "Image-8"),"Title":"Just Now","Image":#imageLiteral(resourceName: "girl_image")],["Name":"Raghav r","Image1":#imageLiteral(resourceName: "white_love"),"Image2": #imageLiteral(resourceName: "Image-6"),"Title":"Just Now","Image":#imageLiteral(resourceName: "download (6)")],["Name":"Raghav t","Image1":#imageLiteral(resourceName: "white_love"),"Image2": #imageLiteral(resourceName: "Image-6"),"Title":"Just Now","Image":#imageLiteral(resourceName: "download (5)")],["Name":"Raghav e","Image1":#imageLiteral(resourceName: "white_love"),"Image2": #imageLiteral(resourceName: "Image-6"),"Title":"Just Now","Image":#imageLiteral(resourceName: "download (6)")],["Name":"Raghav p","Image1":#imageLiteral(resourceName: "white_love"),"Image2": #imageLiteral(resourceName: "Image-6"),"Title":"Just Now","Image":#imageLiteral(resourceName: "images")]
    ]
    var Array :[[String : Any]] = [[ : ]]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.top_image.layer.cornerRadius = self.top_image.frame.height/2
        self.mid_view.layer.cornerRadius = self.mid_view.frame.height/3
        self.mid_view.clipsToBounds = true
        
        search.delegate = self
        self.mycollectionView.reloadData()
        Array = ImageDemo
        
        search.setImage(UIImage(), for: .bookmark, state: .normal)
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).leftViewMode = .never
        
        
        if #available(iOS 14.0, *) {
            self.search.searchTextField.backgroundColor = .white
        } else {
            // Fallback on earlier versions
        }
        
        // Do any additional setup after loading the view.
        self.hodeKeyboardTappedAround()
        
        
        
        
    }
    
    @IBAction func backbutton(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DemoViewController") as! DemoViewController
        self.navigationController?.pushViewController( vc, animated: true)
        
    }
    
    
    @IBAction func submit_btn(_ sender: Any) {

        guard let localValue = search.text   else {
            return
        }
        Array.removeAll()
        if localValue == ""
        {
          Array = ImageDemo
        }
        else{
            print(localValue)
            for word in ImageDemo
            {
                let string =  word["Name"] as? String ?? ""
                if string.contains(localValue ){
                    Array.append(word)
                }
            }
        }
        print(Array.count)
        self.mycollectionView.reloadData()
        print(search.text)
    }
}
extension SearchViewController : UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Array.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCollectionViewCell", for: indexPath) as! myCollectionViewCell
       
        cell.first_lbl.text = Array[indexPath.row]["Name"] as? String ?? ""
        cell.first_image.image = Array[indexPath.row]["Image"] as? UIImage
        cell.second_lbl.text = Array[indexPath.row]["Title"] as? String ?? ""
        cell.second_image.image = Array[indexPath.row]["Image2"] as? UIImage
        cell.love_image.image = Array[indexPath.row]["Image1"] as? UIImage
        
        
        cell.love_image.layer.shadowColor = UIColor.gray.cgColor
        cell.love_image.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        cell.love_image.layer.shadowOpacity = 0.5
        cell.love_image.layer.shadowRadius = 1.0
        cell.love_image.layer.masksToBounds = false
       
        return cell
    }
}

extension SearchViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //return CGSize(width: (view.frame.size.width/2) , height: (view.frame.size.width/2) )
        return CGSize(width: collectionView.frame.width/2 - 7, height: (collectionView.frame.height/2.5 + 20))
        
    }

}

extension SearchViewController {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

        Array = [ ]
        if searchText == ""
        {
            Array = ImageDemo
        }
        else
        {
            for word in ImageDemo
            {
                let big = word["Name"] as? String ?? ""
                if big.contains(searchText)
                {
                    Array.append(word)
                }
            }
            self.mycollectionView.reloadData()
        }
        //print(Array.count)

    }
}
extension SearchViewController {
    func hodeKeyboardTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(SearchViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
extension UISearchBar {
    func getTextField() -> UITextField? { return value(forKey: "searchField") as? UITextField }
    func setTextField(color: UIColor) {
        guard let textField = getTextField() else { return }
        switch searchBarStyle {
        case .minimal:
            textField.layer.backgroundColor = color.cgColor
            textField.layer.cornerRadius = 6
        case .prominent, .default: textField.backgroundColor = color
        @unknown default: break
        }
    }
}
