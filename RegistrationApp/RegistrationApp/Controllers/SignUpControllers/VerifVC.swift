//
//  VerifVC.swift
//  RegistrationApp
//
//  Created by Владимир Данилович on 29.01.22.
//

import UIKit

final class VerifVC: UIViewController {

    @IBOutlet private weak var secretCode: UILabel!

    private var code: String = ""

    var email: String?
    var name: String?
    var pass: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        code = generatorPassCode()
        setupUI()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let email = email,
            let name = name,
            let pass = pass,
            let destVC = segue.destination as? WelcomeVC else { return }

        destVC.email = email
        destVC.name = name
        destVC.pass = pass
    }

    @IBAction private func codeTF(_ sender: UITextField) {
        guard let ourCode = sender.text else { return }
        if VerificationService.isPassCofirm(pass1: code, pass2: ourCode) {
            performSegue(withIdentifier: "showWelcomeVc", sender: nil)
        }
    }
    private func generatorPassCode () -> String {
        let pass = Int.random(in: 1000...9999)
        return String(pass)
    }

    private func setupUI() {
        secretCode.text = "\(email ?? ""), \(name ?? "") Please enter code \(code)"
    }
}
