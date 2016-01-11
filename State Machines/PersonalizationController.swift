//
//  PersonalizationController.swift
//  State Machines
//
//  Created by Phillip Tang on 1/7/16.
//  Copyright © 2016 Phillip Tang. All rights reserved.
//

import UIKit

class PersonalizationController: UIViewController {
    let completion: (user: User) -> ()
    let user: User

    init(user: User, completion:(user: User) -> ()) {
        self.user = user
        self.completion = completion
        super.init(nibName: nil, bundle: nil)
        navigationItem.hidesBackButton = true
        edgesForExtendedLayout = .None
    }

    @IBAction func didTapFinishedLearning(sender: AnyObject) {
        completion(user: user)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
