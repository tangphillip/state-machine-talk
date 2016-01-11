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
    private var currentStep = OnboardingFlowStep.SplashPage
    private let completion : User -> ()

    init(completion: User -> ()) {
        self.completion = completion
        super.init(nibName:nil, bundle:nil)
        performCurrentStep()
    }

    private func performCurrentStep() {
        switch(currentStep) {
        case .SplashPage:
            let splashPage = SplashPage(completion: {loginType in
                switch(loginType) {
                case .Login:
                    self.currentStep = .LoginPage
                case .Registration:
                    self.currentStep = .RegistrationPage
                case .LoggedIn(let user):
                    self.currentStep = .Complete(user)
                case .Registered(let user):
                    self.currentStep = .PersonalizationPage(user)
                }
                self.performCurrentStep()
            })
            self.pushViewController(splashPage, animated: true)
        case .RegistrationPage:
            let registrationController = RegistrationController(completion: {user, isNewUser in
                if isNewUser {
                    self.currentStep = .PersonalizationPage(user)
                } else {
                    self.currentStep = .Complete(user)
                }
                self.dismissViewControllerAnimated(true, completion: nil)
                self.performCurrentStep()
            })
            self.presentViewController(registrationController, animated: true, completion: nil)
        case .LoginPage:
            let loginController = LoginController(completion: {user in
                self.currentStep = .Complete(user)
                self.dismissViewControllerAnimated(true, completion: nil)
                self.performCurrentStep()
            })
            self.presentViewController(loginController, animated: true, completion: nil)
        case .PersonalizationPage(let user):
            let personalizationController = PersonalizationController(user: user, completion: {user in
                self.currentStep = .Complete(user)
                self.performCurrentStep()
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
