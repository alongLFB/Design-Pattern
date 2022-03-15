//
//  main.swift
//  AbstractFactory
//
//  Created by lialong on 14/03/2022.
//

import Foundation

print("Hello, World!")

protocol SportCar {
    
}

class BMWSportCar : SportCar {
    
}

class FerrariSportCar: SportCar {
    
}

protocol BusinessCar {
    
}

class BMWBussinessCar : BusinessCar {
    
}

class FerrariBusinessCar : BusinessCar {
    
}

protocol AbstractCarFactory {
    func creatSportCar() -> SportCar
    
    func creatBuinessCar() -> BusinessCar
}

class BMWFactory: AbstractCarFactory {
    func creatSportCar() -> SportCar {
        return BMWSportCar()
    }
    
    func creatBuinessCar() -> BusinessCar {
        return BMWBussinessCar()
    }
}

class FerrariFactory: AbstractCarFactory {
    func creatSportCar() -> SportCar {
        return FerrariSportCar()
    }
    
    func creatBuinessCar() -> BusinessCar {
        return FerrariBusinessCar()
    }
}

enum CarStyle {
    case bmw
    case ferrari
}

var factory1: AbstractCarFactory
var carStyle1: CarStyle = .bmw

switch carStyle1 {
    case .bmw :
        factory1 = BMWFactory()
    case .ferrari :
        factory1 = FerrariFactory()
}

var sportCar1: SportCar = factory1.creatSportCar()
var business1: BusinessCar = factory1.creatBuinessCar()
print(sportCar1)
print(business1)

var factory2: AbstractCarFactory
var carStyle2: CarStyle = .ferrari

switch carStyle2 {
    case .bmw :
        factory2 = BMWFactory()
    case .ferrari :
        factory2 = FerrariFactory()
}

var sportCar2: SportCar = factory2.creatSportCar()
var business2: BusinessCar = factory2.creatBuinessCar()
print(sportCar2)
print(business2)



