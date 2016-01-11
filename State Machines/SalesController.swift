//
//  SalesController.swift
//  State Machines
//
//  Created by Phillip Tang on 1/11/16.
//  Copyright © 2016 Phillip Tang. All rights reserved.
//

import UIKit

class SalesController: UIViewController {
    let user : User
    let completion : (User) -> ()

    init(user: User, completion: (User) -> ()) {
        self.user = user
        self.completion = completion
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @IBAction func didTapButton(sender: AnyObject) {
        completion(user)
    }

}
