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
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
