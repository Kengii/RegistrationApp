//
//  SignInVC.swift
//  RegistrationApp
//
//  Created by Владимир Данилович on 29.01.22.
//

import UIKit

final class SignInVC: UIViewController {
    
    @IBOutlet private weak var enterEmail: UITextField!
    @IBOutlet private weak var enterPassword: UITextField!
    @IBOutlet private weak var signIn: UIButton!
    @IBOutlet private weak var userNotFound: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUi()
        // Do any additional setup after loading the view.
    }
    
    @IBAction private func enterEm() {
        guard let text = enterEmail.text else { return }
        if text != "" {
            print (345)
        }
    }

    @IBAction private func enterPass() {
        guard let text = enterPassword.text else { return }
        if text.count >= 8 {
            signIn.isEnabled = true
        }
    }

    @IBAction private func pressSignIn() {
        guard let text = enterEmail.text else { return }
        let email = UserDefaults.standard.string(forKey: "email")
        guard let text1 = enterPassword.text else { return }
        let pass = UserDefaults.standard.string(forKey: "email")
        if text != email, text1 != pass {
            userNotFound.isHidden = false
        } else { performSegue(withIdentifier: "mainVC", sender: nil) }
    }
    private func setupUi() {
        signIn.layer.cornerRadius = 20
        signIn.isEnabled = false
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
