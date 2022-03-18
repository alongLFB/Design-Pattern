//
//  main.swift
//  Bridge
//
//  Created by lialong on 18/03/2022.
//

import Foundation

print("Hello, World!")

protocol TV {
    func on()
    func off()
    func tuneChannel(channel: Int)
}

class Haier: TV {
    func on() {
        print("Haier on")
    }
    
    func off() {
        print("Haier off")
    }
    
    func tuneChannel(channel: Int) {
        print("Haier tuneChannel to \(channel) channel")
    }
}

class KONKA: TV {
    func on() {
        print("KONKA on")
    }
    
    func off() {
        print("KONKA off")
    }
    
    func tuneChannel(channel: Int) {
        print("KONKA tuneChannel to \(channel) channel")
    }
}

protocol RemoteControl {
    var tv: TV { get set }
    
    func on()
    func off()
    func setChannel(channel: Int)
}

extension RemoteControl {
    func on () {
        tv.on()
    }
    func off () {
        tv.off()
    }
    func setChannel(channel: Int) {
        tv.tuneChannel(channel: channel)
    }
}

class ConcreteRemote: RemoteControl {
    var tv: TV
    
    var channel: Int
    
    init(tv: TV, channel: Int = 1) {
        self.tv = tv
        self.channel = channel
    }
    
    func nextChannel () {
        self.channel += 1
        setChannel(channel: channel)
    }
    
    func previousChannel() {
        self.channel -= 1
        setChannel(channel: channel)
    }
}

let haierRemote = ConcreteRemote(tv: Haier())
haierRemote.on()
haierRemote.nextChannel()
haierRemote.off()

print("\n")
let konkaRemove = ConcreteRemote(tv: KONKA(), channel: 5)
konkaRemove.on()
konkaRemove.previousChannel()
konkaRemove.off()
