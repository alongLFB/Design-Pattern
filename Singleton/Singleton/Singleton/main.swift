//
//  main.swift
//  Singleton
//
//  Created by lialong on 15/03/2022.
//

import Foundation

print("Hello, World!")

class ShareTools {
    // singleton
    static let shared = ShareTools()
    // private creation, unable create instance outside
    // Private constructor method that does not allow the outside world to create instances
    // private constructor, Do not allow external instances to be created.
    private init () {
        
    }
}
