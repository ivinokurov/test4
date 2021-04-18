//
//  ViewController.swift
//  test4
//
//  Created by И.В. Винокуров
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var pwdTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func checkPwd(_ sender: Any) {
        guard let login = pwdTextField.text else { return }
        
        let isEmail = self.isEmail(login: login)
        let isLengthValid = self.validateLength(login: login)
        let isValidSymbolsValid = self.validateAllSymbols(login: login)
        let isFirstSymbolsValid = self.validateFirstSymbols(login: login)
        
        if isEmail || isLengthValid && isValidSymbolsValid && isFirstSymbolsValid {
        // ...
        }
    }
    
    func isEmail(login: String) -> Bool{
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: login)
    }
    
    func validateLength(login: String) -> Bool {
        let count = login.utf16.count
        let allowedCount = 3 ..< 33
        return allowedCount.contains(count)
    }
    
    func validateAllSymbols(login: String) -> Bool {
        let pattern = "[A-Za-z0-9.-]"
        return login.range(of: pattern, options: .regularExpression) != nil
    }
    
    func validateFirstSymbols(login: String) -> Bool {
        let pattern = "^[0-9.-]"
        return login.range(of: pattern, options: .regularExpression) == nil
    }
}

