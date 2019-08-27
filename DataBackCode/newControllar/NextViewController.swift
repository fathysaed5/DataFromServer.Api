//
//  NextViewController.swift
//  DataBackCode
//
//  Created by fathy  on 7/28/19.
//  Copyright © 2019 fathy . All rights reserved.
//

import UIKit

class NextViewController: UIViewController {
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    //@IBOutlet weak var cusonBtn: CustomButton!
    let url = "http://rate-ak.com/api/clientLogin"
    @IBOutlet weak var passwordN: UITextField!
    @IBOutlet weak var nameN: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
       // cusonBtn.buttonColor()
        self.spinner.isHidden = true
    }
    func createAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Delete", style: .destructive, handler: nil)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func loginButton(_ sender: Any) {
        guard let name = nameN.text, !name.isEmpty else{
            
            return
        }
        guard let password = passwordN.text, !password.isEmpty else {
            
            return
        }
        self.spinner.isHidden = false
        spinner.startAnimating()
        APLDataBack.shared.login(url: url, name: name, password: password) { (loginDate, Error) in
            if let error = Error {
                self.createAlert(message: error.localizedDescription)
                print(error)
                self.spinner.stopAnimating()
            }else {
                guard let myLogin = loginDate else {return}
                
                print(myLogin.data?.email)
                if myLogin.success == true {
                    self.spinner.stopAnimating()
                    self.spinner.isHidden = true
                    let next = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as?LoginViewController
                    next?.loginData = myLogin.data
                    
                    self.navigationController?.pushViewController(next!, animated: true)
                } else{
                    print(myLogin.message)
                    self.spinner.stopAnimating()
                    self.spinner.isHidden = true
                }
                
            }
        }
    }
    
    @IBAction func Click(_ sender: UITextField) {
 
    }
}
