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
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var enterName: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUi()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let email = enterEmail.text,
            let name = enterName.text,
            let pass = enterPassword.text,
            let destVC = segue.destination as? VerifVC else { return }

        destVC.email = email
        destVC.name = name
        destVC.pass = pass
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

    @IBAction private func tupSignUp() {
        performSegue(withIdentifier: "showCodeVerVC", sender: nil)
    }

    @IBAction private func tupSignIn() {
        navigationController?.popToRootViewController(animated: true)
    }

    private func setupUi() {
        sgnUp.layer.cornerRadius = 20
        viewGreen.alpha = 0.3
        viewYellow.alpha = 0.3
        viewOrange.alpha = 0.3
        viewRed.alpha = 0.3
        sgnUp.isEnabled = false
    }

    private func startKeyboardObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(CreateAccountVC.keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(CreateAccountVC.keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc private func keyboardWillShow(notification: Notification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0.0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }

    @objc private func keyboardWillHide() {
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
}
