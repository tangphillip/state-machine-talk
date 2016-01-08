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
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
