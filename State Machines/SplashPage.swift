//
//  SplashPage.swift
//  State Machines
//
//  Created by Phillip Tang on 1/6/16.
//  Copyright © 2016 Phillip Tang. All rights reserved.
//

import UIKit

enum SplashPageResult {
    case Login
    case Registration
    case Registered(User)
    case LoggedIn(User)
}

class SplashPage: UIViewController {
    let completion: SplashPageResult -> ()

    init(completion: SplashPageResult -> ()) {
        self.completion = completion
        super.init(nibName: nil, bundle: nil)
        edgesForExtendedLayout = .None
    }

    @IBAction func didTapLogin(sender: AnyObject) {
        completion(.Login)
    }
    @IBAction func didTapSignUp(sender: AnyObject) {
        completion(.Registration)
    }
    @IBAction func didTapFacebookLogin(sender: AnyObject) {
        User.logInWithFacebook { result in
            switch(result) {
            case .LoginSuccess(let user):
                self.completion(.LoggedIn(user))
            case .RegistrationSuccess(let user):
                self.completion(.Registered(user))
            case .Failure:
                let controller = UIAlertController(title: "Failure", message: "Oh no!", preferredStyle: .Alert)
                self.presentViewController(controller, animated: true, completion: nil)
            }
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
