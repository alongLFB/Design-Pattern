//
//  main.swift
//  Builder
//
//  Created by lialong on 15/03/2022.
//

import Foundation

print("Hello, World!")

protocol Packing {
    var pack: String { get }
}

class Box: Packing {
    var pack: String {
        "纸盒"
    }
}

class Bottle: Packing {
    var pack: String {
        "瓶子"
    }
}

protocol Item {
    var name: String {get}
    var packing: Packing {get}
    var price: Double {get}
}

class Burger: Item {
    var packing: Packing {
        Box()
    }
    var price: Double {
        15
    }
    var name: String {
        "汉堡"
    }
}

class VegBurger: Burger {
    override var price: Double {
        25
    }
    override var name: String {
        "素食汉堡"
    }
}

class ChickenBurger: Burger {
    override var price: Double {
        35
    }
    override var name: String {
        "鸡肉汉堡"
    }
}

class ColdDrink: Item {
    var packing: Packing {
        Bottle()
    }
    var price: Double {
        10
    }
    var name: String {
        "冷饮"
    }
}

class Coke: ColdDrink {
    override var price: Double {
        20
    }
    override var name: String {
        "可口可乐"
    }
}

class PepSi: ColdDrink {
    override var price: Double {
        25
    }
    override var name: String {
        "百事可乐"
    }
}

class Meal {
    var items: [Item] = []
    
    func add(item: Item) {
        items.append(item)
    }
    
    func getCost() -> Double {
        return items.reduce(0) { partialResult, item in
            return partialResult + item.price
        }
    }
    
    func showItems() {
        items.forEach { item in
            print("条目：\(item.name), 打包：\(item.packing.pack), 价格：\(item.price)")
        }
    }
}

class MealBuilder {
    func makeVegMeal() -> Meal {
        let meal = Meal()
        meal.add(item: VegBurger())
        meal.add(item: Coke())
        return meal
    }
    
    func makeNonVegMeal() -> Meal {
        let meal = Meal()
        meal.add(item: ChickenBurger())
        meal.add(item: PepSi())
        return meal
    }
}

let mealBuilder = MealBuilder()

print("素食套餐")
let vegMeal = mealBuilder.makeVegMeal()
vegMeal.showItems()
print("总计：\(vegMeal.getCost())")

print("非素食套餐")
let nonVegMeal = mealBuilder.makeNonVegMeal()
nonVegMeal.showItems()
print("总计：\(nonVegMeal.getCost())")
