//
//  main.swift
//  Interface adapter
//
//  Created by lialong on 17/03/2022.
//

import Foundation

print("Hello, World!")

protocol AllPorts {
    func typeC()
    func vga()
    func hdmi()
}

class Adapter: AllPorts {
    func typeC() {
        
    }
    
    func vga() {
        
    }
    
    func hdmi() {
        
    }
}

class TypeCToVGA: Adapter {
    override func typeC() {
        print("signal from Type-C interface")
    }
    
    override func vga() {
        print("signal from VGA interface")
    }
}

let typeCToVGA: TypeCToVGA = TypeCToVGA()
typeCToVGA.typeC()
typeCToVGA.vga()
