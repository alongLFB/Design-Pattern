//
//  main.swift
//  Adapter
//
//  Created by lialong on 17/03/2022.
//

import Foundation

print("Hello, World!")

// class adapter

protocol MicroUSB {
    func microUSB()
}

protocol TypeC {
    func typeC()
}

class Phone: TypeC {
    func typeC() {
        print("Type-C interface")
    }
}

/// adapter
class Adapter: Phone {

}

extension Adapter: MicroUSB {
    func microUSB() {
        typeC()
    }
}

let phone = Phone()
phone.typeC()

let adapter = Adapter()
adapter.microUSB()
