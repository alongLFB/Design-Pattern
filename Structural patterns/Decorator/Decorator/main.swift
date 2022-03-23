//
//  main.swift
//  Decorator
//
//  Created by lialong on 23/03/2022.
//

import Foundation

print("Hello, World!")

protocol Shape {
    func draw()
}

class Rectangle: Shape {
    func draw() {
        print("Rectangle")
    }
}

class Circle: Shape {
    func draw() {
        print("Circle")
    }
}

class ShapeDecorator: Shape {
    let decoratedShape: Shape
    
    init(shape: Shape) {
        self.decoratedShape = shape
    }
    
    func draw() {
        decoratedShape.draw()
    }
}

class RedShapeDecorator: ShapeDecorator {
    override func draw() {
        super.draw()
        setRedBorder()
    }
    
    func setRedBorder() {
        print("border : red")
    }
}

let circle = Circle()

let redCircle = RedShapeDecorator(shape: Circle())
let redRectangle = RedShapeDecorator(shape: Rectangle())

print("no border circle")
circle.draw()

print("red border circle")
redCircle.draw()

print("red border rectangle")
redRectangle.draw()
