//
//  ViewController.swift
//  DataBackCode
//
//  Created by fathy  on 7/28/19.
//  Copyright © 2019 fathy . All rights reserved.
//

import UIKit
protocol transfirData {
    func loginData(name:String)
}

class ViewController: UIViewController {
    @IBOutlet weak var nameTF: UITextField!
    var delegate:transfirData?
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    let url = "http://rate-ak.com/api/clientRegister"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    fileprivate func createAlertMessag(message:String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Delete", style: .destructive, handler: nil)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
    func validateEmail(candidate: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: candidate)
    }
    
    @IBAction func ClickButtom(_ sender: UIButton) {
        guard let name = nameTF.text, !name.isEmpty else{
            createAlertMessag(message: "please chek your name")
            return
        }
        guard let password = passwordTF.text, !password.isEmpty else {
            createAlertMessag(message: "please chek your password")
            return
        }
        guard let validMail = emailTF.text, !validMail.isEmpty,validateEmail(candidate: validMail) else {
            createAlertMessag(message: "plase enter valid mail format")
            return
        }
       
        
        guard let phone = phoneTF.text, !phone.isEmpty else {
            createAlertMessag(message: "please chek your phoneNamber")
            return
        }
        APLDataBack.shared.regesterData(url: url, name: name, password: password, email: validMail, phone: phone) { (DataBackn, Error) in
            if let myerror = Error {
                print(myerror)
            }else {
                guard let myData = DataBackn else {return}
                print(myData.success)
                if myData.success == true {
                    let home = self.storyboard?.instantiateViewController(withIdentifier: "NextViewController") as?NextViewController
                    
                   // self.delegate?.loginData(name: self.nameTF.text!)
                    self.navigationController?.pushViewController(home!, animated: true)
                }else{
                    self.createAlertMessag(message: myData.message!)
                }
            }
            
        }
    
        
    
    
}

}
