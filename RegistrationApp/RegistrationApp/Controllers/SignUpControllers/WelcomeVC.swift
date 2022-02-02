//
//  WelcomeVC.swift
//  RegistrationApp
//
//  Created by Владимир Данилович on 29.01.22.
//

import UIKit

final class WelcomeVC: UIViewController {

    var email: String?
    var name: String?
    var pass: String?
    
    private func saveUser() {
        UserDefaults.standard.set(name, forKey: "name")
        UserDefaults.standard.set(email, forKey: "email")
        UserDefaults.standard.set(pass, forKey: "pass")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction private func tupContinue() {
        navigationController?.popToRootViewController(animated: true)
        saveUser()
    }
}
