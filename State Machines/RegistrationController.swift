//
//  RegistrationController.swift
//  State Machines
//
//  Created by Phillip Tang on 1/6/16.
//  Copyright © 2016 Phillip Tang. All rights reserved.
//

import UIKit

class RegistrationController: UIViewController {
    let completion: (user: User, isNewUser: Bool) -> ()

    init(completion: (user: User, isNewUser: Bool) -> ()) {
        self.completion = completion
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .OverFullScreen
        modalTransitionStyle = .CrossDissolve
    }

    @IBAction func didTapEnter(sender: AnyObject) {
        completion(user: User(), isNewUser: false)
    }
    @IBAction func didTapSignUp(sender: AnyObject) {
        completion(user: User(), isNewUser: true)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
