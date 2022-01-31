//
//  CreateAccountVC.swift
//  RegistrationApp
//
//  Created by Владимир Данилович on 29.01.22.
//

import UIKit

final class CreateAccountVC: UIViewController {

    @IBOutlet private weak var viewGreen: UIView!
    @IBOutlet private weak var viewYellow: UIView!
    @IBOutlet private weak var viewOrange: UIView!
    @IBOutlet private weak var viewRed: UIView!
    @IBOutlet private weak var notRightEmail: UILabel!
    @IBOutlet private weak var notRightPassword: UILabel!
    @IBOutlet private weak var noCoincid: UILabel!
    @IBOutlet private weak var enterPassword: UITextField!
    @IBOutlet private weak var enterEmail: UITextField!
    @IBOutlet private weak var confirmPass: UITextField!
    @IBOutlet private weak var sgnUp: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUi()
    }

    @IBAction private func EnterPassword() {
        guard let text = enterPassword.text else { return }
        let verPass = VerificationService.isValidPassword(pass: text)
        switch verPass {
        case .veryWeak:
            self.viewGreen.alpha = 0.3
            self.viewYellow.alpha = 0.3
            self.viewOrange.alpha = 0.3
            self.viewRed.alpha = 0.3
        case .weak:
            self.viewGreen.alpha = 1
            self.viewYellow.alpha = 0.3
            self.viewOrange.alpha = 0.3
            self.viewRed.alpha = 0.3
        case .notVeryStrong:
            self.viewGreen.alpha = 1
            self.viewYellow.alpha = 1
            self.viewOrange.alpha = 0.3
            self.viewRed.alpha = 0.3
        case .notVeryWeak:
            self.viewGreen.alpha = 1
            self.viewYellow.alpha = 1
            self.viewOrange.alpha = 1
            self.viewRed.alpha = 0.3
        case .strong:
            self.viewGreen.alpha = 1
            self.viewYellow.alpha = 1
            self.viewOrange.alpha = 1
            self.viewRed.alpha = 1
        }
    }

    @IBAction private func pressEmail() {
        guard let text = enterEmail.text else { return }
        let verEmail = VerificationService.isValidEmail(email: text)
        if verEmail == false {
            notRightEmail.isHidden = false
        } else { notRightEmail.isHidden = true }
    }

    @IBAction private func confPass() {
        guard let text = enterPassword.text else { return }
        guard let text1 = confirmPass.text else { return }
        let conPas = VerificationService.isPassCofirm(pass1: text, pass2: text1)
        if conPas == false {
            noCoincid.isHidden = false
        } else { noCoincid.isHidden = true; sgnUp.isEnabled = true }

    }

    private func setupUi() {
        sgnUp.layer.cornerRadius = 20
        viewGreen.alpha = 0.3
        viewYellow.alpha = 0.3
        viewOrange.alpha = 0.3
        viewRed.alpha = 0.3
        sgnUp.isEnabled = false
    }

}
