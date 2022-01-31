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
        let verEmail = VerificationService.isValidEmail(email: text)
        if verEmail == false {
            userNotFound.isHidden = false
        } else { userNotFound.isHidden = true }
    }

    @IBAction private func enterPass() {
        guard let text = enterPassword.text else { return }
        if text.count < 8 {
            userNotFound.isHidden = false
        } else { signIn.isEnabled = true; userNotFound.isHidden = true }
    }

    @IBAction private func pressSignIn() {

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
