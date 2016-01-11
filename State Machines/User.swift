//
//  User.swift
//  State Machines
//
//  Created by Phillip Tang on 1/6/16.
//  Copyright © 2016 Phillip Tang. All rights reserved.
//


enum LoginResult {
    case Failure(ErrorType)
    case LoginSuccess(User)
    case RegistrationSuccess(User)
}

struct User {
    static func logInWithFacebook(completion: LoginResult -> ()) {
        completion(.LoginSuccess(User()))
    }

    static func logIn(username: String, password: String, completion: LoginResult -> ()) {

    }
}
