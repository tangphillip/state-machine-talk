//
//  MainAppViewController.swift
//  State Machines
//
//  Created by Phillip Tang on 1/8/16.
//  Copyright © 2016 Phillip Tang. All rights reserved.
//

import UIKit

class MainAppViewController: UIViewController {
    @IBAction func didTapSignOut(sender: AnyObject) {
        let onboardingFlow = OnboardingFlowController(completion: { user in
            self.dismissViewControllerAnimated(true, completion: nil)
        });
        self.presentViewController(onboardingFlow, animated: true, completion: nil)
    }
}
