//
//  main.swift
//  Flyweight
//
//  Created by lialong on 24/03/2022.
//

import Foundation

print("Hello, World!")

import Foundation

protocol IFlyweight {
    func setDetail(width: Int, height: Int)
}

struct Color {
    let type: String
    
    init(type: String) {
        self.type = type
    }
}

class FlyweightImpl: IFlyweight {
    
    private var color: Color
    private var width: Int
    private var height: Int
    
    init(color: Color) {
        self.color = color
        self.width = 0
        self.height = 0
    }
    
    func setDetail(width: Int, height: Int) {
        self.width = width
        self.height = height
        print("对象地址: \(Unmanaged.passUnretained(self).toOpaque()) color: \(color.type) width: \(width) height: \(height) ")
    }
    
    func itself() {
        print("对象地址: \(Unmanaged.passUnretained(self).toOpaque()) color: \(color.type) width: \(width) height: \(height) \n")
    }
}

class FlyweightFactory {
    private var colorFlyweighMap: [String: FlyweightImpl] = [:]
    
    func getFlyweight(colorName: String) -> FlyweightImpl? {
        if colorFlyweighMap.keys.contains(colorName) {
            return colorFlyweighMap[colorName]
        } else {
            let color = Color(type: colorName)
            let impl = FlyweightImpl(color: color)
            colorFlyweighMap[colorName] = impl
            return impl
        }
    }
}

let factory = FlyweightFactory()

let flyweight0 = factory.getFlyweight(colorName: "red")
flyweight0?.setDetail(width: 100, height: 200)

let flyweight1 = factory.getFlyweight(colorName: "red")
flyweight1?.setDetail(width: 100, height: 400)
flyweight0?.itself()
flyweight1?.itself()

let flyweight2 = factory.getFlyweight(colorName: "green")
flyweight2?.setDetail(width: 300, height: 300)
