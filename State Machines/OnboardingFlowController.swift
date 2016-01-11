//
//  OnboardingFlowController.swift
//  State Machines
//
//  Created by Phillip Tang on 1/6/16.
//  Copyright © 2016 Phillip Tang. All rights reserved.
//

import UIKit

private enum OnboardingFlowStep {
    case SplashPage
    case LoginPage
    case RegistrationPage
    case PersonalizationPage(User)
    case Complete(User)
}

class OnboardingFlowController: UINavigationController {
    private let completion : User -> ()

    init(completion: User -> ()) {
        self.completion = completion
        super.init(nibName:nil, bundle:nil)
        performStep(.SplashPage)
    }

    private func performStep(nextStep: OnboardingFlowStep) {
        switch(nextStep) {
        case .SplashPage:
            let splashPage = SplashPage(completion: {loginType in
                switch(loginType) {
                case .Login:
                    self.performStep(.LoginPage)
                case .Registration:
                    self.performStep(.RegistrationPage)
                case .LoggedIn(let user):
                    self.performStep(.Complete(user))
                case .Registered(let user):
                    self.performStep(.PersonalizationPage(user))
                }
            })
            self.pushViewController(splashPage, animated: true)
        case .RegistrationPage:
            let registrationController = RegistrationController(completion: {user, isNewUser in
                self.dismissViewControllerAnimated(true, completion: nil)
                if isNewUser {
                    self.performStep(.PersonalizationPage(user))
                } else {
                    self.performStep(.Complete(user))
                }
            })
            self.presentViewController(registrationController, animated: true, completion: nil)
        case .LoginPage:
            let loginController = LoginController(completion: {user in
                self.dismissViewControllerAnimated(true, completion: nil)
                self.performStep(.Complete(user))
            })
            self.presentViewController(loginController, animated: true, completion: nil)
        case .PersonalizationPage(let user):
            let personalizationController = PersonalizationController(user: user, completion: {user in
                self.performStep(.Complete(user))
            })
            self.pushViewController(personalizationController, animated: true)
        case .Complete(let user):
            completion(user)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
