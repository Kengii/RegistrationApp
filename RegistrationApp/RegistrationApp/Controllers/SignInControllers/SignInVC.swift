//
//  SignInVC.swift
//  RegistrationApp
//
//  Created by Владимир Данилович on 29.01.22.
//

import UIKit

class SignInVC: UIViewController {

    @IBOutlet weak var enterEmail: UITextField!
    @IBOutlet weak var enterPassword: UITextField!
    @IBOutlet weak var signIn: UIButton!
    @IBOutlet weak var userNotFound: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        signIn.isEnabled = false
        setupUi()
        // Do any additional setup after loading the view.
    }

    @IBAction func enterEm() {
        guard let text = enterEmail.text else { return }
        let verEmail = VerificationService.isValidEmail(email: text)
        if verEmail == false {
            userNotFound.isHidden = false
        } else { userNotFound.isHidden = true }
    }

    @IBAction func enterPass() {
        guard let text = enterPassword.text else { return }
        if text.count < 8 {
            userNotFound.isHidden = false
        } else { signIn.isEnabled = true; userNotFound.isHidden = true }
    }

    @IBAction func pressSignIn() {

    }
    func setupUi() {
        signIn.layer.cornerRadius = 20
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
