//
//  LoginController.swift
//  State Machines
//
//  Created by Phillip Tang on 1/8/16.
//  Copyright © 2016 Phillip Tang. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    private let completion: (user: User) -> ()

    init(completion: (user: User) -> ()) {
        self.completion = completion
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .OverFullScreen
        modalTransitionStyle = .CrossDissolve
    }

    @IBAction private func didTypeEnter(sender: AnyObject) {
        completion(user: User())
    }
    @IBAction private func didTapLogIn(sender: AnyObject) {
        completion(user: User())
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
