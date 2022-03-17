//
//  main.swift
//  Instance adapter
//
//  Created by lialong on 17/03/2022.
//

import Foundation

print("Hello, World!")

/// instance adapter

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

class Adapter: MicroUSB {
    
    private var typeC: TypeC
    
    init(typeC: TypeC) {
        self.typeC = typeC
    }
    
    func microUSB() {
        self.typeC.typeC()
    }
    
}

let typeC: TypeC = Phone()
let microUSD = Adapter(typeC: typeC)
microUSD.microUSB()
