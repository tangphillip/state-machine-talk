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
    private var flowStep = OnboardingFlowStep.SplashPage
    let completion : User -> ()

    init(completion: User -> ()) {
        self.completion = completion
        super.init(navigationBarClass: nil, toolbarClass: nil)
    }

    func nextStep() {
        switch(flowStep) {
        case .SplashPage:
            let splashPage = SplashPage(completion: {[weak self] loginType in
                switch(loginType) {
                case .Login:
                    self?.flowStep = .LoginPage
                case .Registration:
                    self?.flowStep = .RegistrationPage
                case .LoggedIn(let user):
                    self?.flowStep = .Complete(user)
                case .Registered(let user):
                    self?.flowStep = .PersonalizationPage(user)
                }
                self?.nextStep()
            })
            self.pushViewController(splashPage, animated: true)
        case .RegistrationPage:
            let registrationController = RegistrationController(completion: {[weak self] user, isNewUser in
                if isNewUser {
                    self?.flowStep = .PersonalizationPage(user)
                } else {
                    self?.flowStep = .Complete(user)
                }
                self?.dismissViewControllerAnimated(true, completion: nil)
                self?.nextStep()
            })
            self.presentViewController(registrationController, animated: true, completion: nil)
        case .LoginPage:
            let loginController = LoginController(completion: {[weak self] user in
                self?.flowStep = .Complete(user)
                self?.dismissViewControllerAnimated(true, completion: nil)
                self?.nextStep()
            })
            self.presentViewController(loginController, animated: true, completion: nil)
        case .PersonalizationPage(let user):
            let personalizationController = PersonalizationController(user: user, completion: {[weak self] user in
                self?.flowStep = .Complete(user)
                self?.nextStep()
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
