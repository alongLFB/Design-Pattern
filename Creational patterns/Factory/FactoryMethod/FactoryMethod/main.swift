//
//  main.swift
//  FactoryMethod
//
//  Created by lialong on 14/03/2022.
//

import Foundation

print("Hello, World!")

protocol Reader {
    func read()
}

class JPGReader: Reader {
    func read() {
         print("read JPG")
    }
}

class PNGReader: Reader {
    func read() {
         print("read PNG")
    }
}

class GIFReader: Reader {
    func read() {
         print("read GIF")
    }
}

protocol ReaderFactory {
    func getReader() -> Reader
}

class JPGReaderFactory: ReaderFactory {
    func getReader() -> Reader {
        return JPGReader()
    }
}

class PNGReaderFactory: ReaderFactory {
    func getReader() -> Reader {
        PNGReader()
    }
}

class GIFReaderFactory: ReaderFactory {
    func getReader() -> Reader {
        GIFReader()
    }
}

var factory: ReaderFactory = JPGReaderFactory()
var reader: Reader = factory.getReader()
reader.read()

factory = PNGReaderFactory()
reader = factory.getReader()
reader.read()

factory = GIFReaderFactory()
reader = factory.getReader()
reader.read()


