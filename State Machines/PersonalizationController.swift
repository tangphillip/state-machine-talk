//
//  PersonalizationController.swift
//  State Machines
//
//  Created by Phillip Tang on 1/7/16.
//  Copyright © 2016 Phillip Tang. All rights reserved.
//

import UIKit

class PersonalizationController: UIViewController {
    @IBAction func onboardingComplete() {
        self.completion(User())
    }

    let completion: User -> ()
    let user: User

    init(user: User, completion:User -> ()) {
        self.user = user
        self.completion = completion
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
