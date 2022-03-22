//
//  main.swift
//  Composite
//
//  Created by lialong on 22/03/2022.
//

import Foundation

print("Hello, World!")

protocol File {
    var name: String {get set}
    func open()
}

final class eBook: File {
    var name: String
    var author: String
    
    init(name: String, author: String) {
        self.name = name
        self.author = author
    }
    
    func open() {
        print("open the book named \(name) which written by \(author)")
    }
}

final class Music: File {
    var name: String
    var artist: String
    
    init(name: String, artist: String) {
        self.name = name
        self.artist = artist
    }
    
    func open() {
        print("open the music named \(name) which sang by \(artist)")
    }
}

final class Folder: File {
    var name: String
    lazy var files: [File] = []
    
    init(name: String) {
        self.name = name
    }
    
    func addFile(file: File) {
        self.files.append(file)
    }
    
    func open() {
        print("\(name) has files:")
        files.forEach { file in
            print(file.name)
        }
        print("\n")
    }
}

let psychoKiller = Music(name: "Psycho Killer", artist: "The Talking Heads")
let rebelRebel = Music(name: "Reble Rebel", artist: "David Bowie")
let blisterInTheSun = Music(name: "Blister in the Sun", artist: "Violent Femmes")

let justKids = eBook(name: "Just Kids", author: "Patti Smith")
let documents = Folder(name: "Documents")
let musicFolder = Folder(name: "最喜欢的70首音乐")
documents.addFile(file: musicFolder)
documents.addFile(file: justKids)
musicFolder.addFile(file: psychoKiller)
musicFolder.addFile(file: rebelRebel)

blisterInTheSun.open()
justKids.open()

documents.open()
musicFolder.open()
