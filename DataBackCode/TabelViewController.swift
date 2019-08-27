
//
//  TabelViewController.swift
//  DataBackCode
//
//  Created by fathy  on 8/1/19.
//  Copyright © 2019 fathy . All rights reserved.
//

import UIKit
import Alamofire

class TabelViewController: UIViewController {
    @IBOutlet weak var searchBarButtom: UISearchBar!
    
    @IBOutlet weak var tabelView: UITableView!
    var arrayName = ["dataBack"]
   var seachClick = [String]()
    var searching = false
    var DataBack =  [dataBack]()
    //let catsData = [DataBack]
    var transData = [String]()
    var resltTranData = UISearchController()
    override func viewDidLoad() {
        super.viewDidLoad()
        

        tabelView.delegate = self
        tabelView.dataSource = self
        searchBarButtom.delegate = self
        GetDataFromServerr()


    }
    func GetDataFromServerr() {
        let url = "https://jsonplaceholder.typicode.com/posts"
        Alamofire.request(url).responseJSON { (responc) in
            do {
                let post = try JSONDecoder().decode([dataBack].self, from: responc.data!)

                self.DataBack = post
             self.tabelView.reloadData()
            } catch let Error {
                print(Error)
                }
                
            }
        
        }
    
    
    //@IBOutlet var Search: [UISearchBar]!
    //var arrayS = [dataBack].self
    
    
    

}
extension TabelViewController:UITableViewDelegate{
    
}

extension TabelViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            
             return seachClick.count
            
            
        }else {
            
            
            return arrayName.count
        }
        
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tabelView.dequeueReusableCell(withIdentifier: "TestTableViewCell", for: indexPath) as?TestTableViewCell
        if searching {
        cell?.lebalTabel.text = seachClick[indexPath.row]
        } else {
            
            cell?.lebalTabel.text = arrayName[indexPath.row]

        }
        return cell!
    
    
}


}
extension TabelViewController:UISearchBarDelegate {
   func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
      seachClick = arrayName.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
      searching = true
      tabelView.reloadData()

   }
   func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
       searchBar.text = ""
       searching = false
       tabelView.reloadData()
}
}


       

    
    

