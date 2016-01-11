//
//  LoginController.swift
//  State Machines
//
//  Created by Phillip Tang on 1/8/16.
//  Copyright © 2016 Phillip Tang. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    let completion: (user: User) -> ()

    init(completion: (user: User) -> ()) {
        self.completion = completion
        super.init(nibName: nil, bundle: nil)
        self.modalPresentationStyle = .OverFullScreen
        self.modalTransitionStyle = .CrossDissolve
    }

    @IBAction func didTypeEnter(sender: AnyObject) {
        self.completion(user: User())
    }
    @IBAction func didTapLogIn(sender: AnyObject) {
        self.completion(user: User())
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
