//
//  main.swift
//  SimpleFactory
//
//  Created by lialong on 14/03/2022.
//

import Foundation

print("Hello, World!")

enum Style {case mac, win}

protocol Button {}
class MacButton: Button {}
class WinButton: Button {}

class ButtonFactory {
    func createButton(style: Style) -> Button {
        switch style {
        case .mac:
            return MacButton()
        default:
            return WinButton()
        }
    }
}

var fac = ButtonFactory()
let button1 = fac.createButton(style: .mac)
let button2 = fac.createButton(style: .win)
print(button1)
print(button2)


