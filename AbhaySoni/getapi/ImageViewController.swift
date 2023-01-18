//
//  ImageViewController.swift
//  AbhaySoni
//
//  Created by bizbrolly on 24/01/22.
//

import UIKit

class ImageViewController: UIViewController , UISearchBarDelegate , UIScrollViewDelegate {
    var fetchcountry :[[String:String]] = []
    var mystringdata: [[String:String]] = []
    var searchbar  = UISearchBar()
    
    var indexing = 1
    //MARK: outlets
    @IBOutlet weak var SearchBar: UISearchBar!
    
    @IBOutlet weak var imageview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        parseData(page: 20)
        searchbar.delegate = self
        hodeKeyboardTappedAround()
        //loadmoredata(current_page: Int)
    }
    //MARK:api integration
    func parseData(page: Int) {
        let url = "https://shibe.online/api/shibes?count=\(page)&urls=true&httpsUrls=true"
        var request =  URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, Error) in
            if Error != nil {
                print("Error")
            }
            else {
                do {
                    let fetchData = try JSONSerialization.jsonObject(with: data!, options: .mutableLeaves) as! [String]
                    print (fetchData)
        
                        
                        for word in fetchData {
                            var localData : [String:String] = ["Images":"","data":""]
                            localData["Images"] = word
                            localData["data"] = "image\(self.indexing)"
                            self.fetchcountry.append(localData)
                            self.indexing += 1
                       }
                        self.mystringdata = self.fetchcountry
                        print(self.fetchcountry)
                        self.imageview.reloadData()
                    
              }
               catch {
                    print("Error 2")
                }
            }
        }
        task.resume()
    }
       
}
extension ImageViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return mystringdata.count
        }
        else {
            return 1
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageTableViewCell", for: indexPath) as! ImageTableViewCell
        
        //if indexPath.row == mystringdata.count - 1 {
            if let url = URL(string: mystringdata[indexPath.row]["Images"] ?? ""){
            cell.apiimage.load(url: url)
            }
            cell.apiname.text = mystringdata[indexPath.row]["data"] ?? ""
        //}
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if tableView.contentOffset.y >= (tableView.contentSize.height - tableView.frame.size.height) && indexPath.row < 80 {
            
                parseData(page: 20)
            
        }

       // let lastItem = fetchcountry.count
       // if indexPath.row == fetchcountry.count - 1 {
        //}
    }
}
var imagecahce = NSCache<AnyObject , UIImage>()
extension UIImageView {
    func load(url: URL) {
        if let cachedImage = imagecahce.object(forKey: url as! AnyObject)  {
            debugPrint("image loaded from cache for =\(url)")
                    self.image = cachedImage
                    return
                }
        DispatchQueue.global().async {
            [weak self]in
            if let data = try? Data (contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        imagecahce.setObject(image, forKey: url as! AnyObject)
                        self?.image = image
                    }
                }
            }
        }
    }
}
extension ImageViewController {
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            mystringdata.removeAll()
            guard let searchText = SearchBar.text   else {
                return
            }
            print(searchText)
        if searchText == ""
        {
            mystringdata = fetchcountry
        }
        else
        {
            for data in fetchcountry
            {
                if data["data"]?.contains(searchText) ?? true {
                    mystringdata.append(data)
                    print(mystringdata)
                }
            }
        }
            self.imageview.reloadData()
    }
}
extension ImageViewController {
    func hodeKeyboardTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ImageViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
