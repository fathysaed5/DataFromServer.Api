//
//  LoginViewController.swift
//  DataBackCode
//
//  Created by fathy  on 7/28/19.
//  Copyright © 2019 fathy . All rights reserved.
//

import UIKit
import Kingfisher

class LoginViewController: UIViewController {
      var loginData: Data?
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneNamber: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = loginData?.name
        phoneNamber.text = loginData?.mobile
        emailLabel.text = loginData?.email
        //let imageData = loginData?.image
        let url = URL(string: "https://media.wired.com/photos/5a595516f11e325008172bcb/master/pass/BabyGlimpseBaby-640504936.jpg")
        profileImageView.kf.setImage(with: url)

    }

    @IBAction func ClickNext(_ sender: Any) {
       let nextPag = storyboard?.instantiateViewController(withIdentifier: "TabelViewController") as?TabelViewController
        navigationController?.pushViewController(nextPag!, animated: true)
    }
    
}
