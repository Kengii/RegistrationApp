//
//  CreateAccountVC.swift
//  RegistrationApp
//
//  Created by Владимир Данилович on 29.01.22.
//

import UIKit

class CreateAccountVC: UIViewController {

    @IBOutlet weak var viewGreen: UIView!
    @IBOutlet weak var viewYellow: UIView!
    @IBOutlet weak var viewOrange: UIView!
    @IBOutlet weak var viewRed: UIView!
    @IBOutlet weak var notRightEmail: UILabel!
    @IBOutlet weak var notRightPassword: UILabel!
    @IBOutlet weak var noCoincid: UILabel!
    @IBOutlet weak var enterPassword: UITextField!
    @IBOutlet weak var enterEmail: UITextField!
    @IBOutlet weak var confirmPass: UITextField!
    @IBOutlet weak var sgnUp: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        viewGreen.alpha = 0.3
        viewYellow.alpha = 0.3
        viewOrange.alpha = 0.3
        viewRed.alpha = 0.3
        sgnUp.isEnabled = false
        setupUi()
    }

    @IBAction func EnterPassword() {
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

    @IBAction func pressEmail() {
        guard let text = enterEmail.text else { return }
        let verEmail = VerificationService.isValidEmail(email: text)
        if verEmail == false {
            notRightEmail.isHidden = false
        } else { notRightEmail.isHidden = true }
    }

    @IBAction func confPass() {
        guard let text = enterPassword.text else { return }
        guard let text1 = confirmPass.text else { return }
        let conPas = VerificationService.isPassCofirm(pass1: text, pass2: text1)
        if conPas == false {
            noCoincid.isHidden = false
        } else { noCoincid.isHidden = true; sgnUp.isEnabled = true }

    }

    func setupUi() {
        sgnUp.layer.cornerRadius = 20
    }

}
