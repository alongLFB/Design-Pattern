import UIKit

var greeting = "Hello, playground"

enum ButtonType {
    case mac
    case win
}

protocol Button {
    
}

class MacButton: Button {
    
}

class WinButton: Button {
    
}

class ButtonFactory {
    func creatButton(style: ButtonType) -> Button {
        switch style {
        case.mac :
            return MacButton()
        case .win :
            return WinButton()
        }
    }
}

var style: ButtonType = .mac
var fac = ButtonFactory()
let button1 = fac.creatButton(style: .mac)
let button2 = fac.creatButton(style: .win)
