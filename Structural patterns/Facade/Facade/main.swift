//
//  main.swift
//  Facade
//
//  Created by lialong on 24/03/2022.
//

import Foundation

print("Hello, World!")

typealias ModelZipPath = (srcFilePath: String, dstFilePath: String)

protocol Model {
    func compress(path: ModelZipPath)
    func decompress(path: ModelZipPath)
}

class ZIPMode: Model {
    func compress(path: ModelZipPath) {
        print("ZIP model is compressing")
        print("文件压缩成功,已保存至\(path.dstFilePath)")
    }
    
    func decompress(path: ModelZipPath) {
        print("ZIP model is decompressing")
        print("文件压解缩成功,已保存至\(path.dstFilePath)")
    }
}

class RARMode: Model {
    func compress(path: ModelZipPath) {
        print("RARMode is compressing")
        print("文件压缩成功,已保存至\(path.dstFilePath)")
    }
    
    func decompress(path: ModelZipPath) {
        print("RARMode is decompressing")
        print("文件压解缩成功,已保存至\(path.dstFilePath)")
    }
}

class ZMode: Model {
    func compress(path: ModelZipPath) {
        print("ZMode is compressing")
        print("文件压缩成功,已保存至\(path.dstFilePath)")
    }
    
    func decompress(path: ModelZipPath) {
        print("ZMode is decompressing")
        print("文件压解缩成功,已保存至\(path.dstFilePath)")
    }
}

class CompressionFacade {
    lazy var zipModel = ZIPMode()
    lazy var rarModel = RARMode()
    lazy var zModel = ZMode()
    
    func compress(path: ModelZipPath, type: String) -> Bool {
        let extName = "." + type
        let fullName = path.dstFilePath + extName
        
        if type.lowercased() == "zip" {
            zipModel.compress(path: (path.srcFilePath, fullName))
        } else if type.lowercased() == "rar" {
            rarModel.compress(path: (path.srcFilePath, fullName))
        } else if type.lowercased() == "7z" {
            zModel.compress(path: (path.srcFilePath, fullName))
        } else {
            print("不支持压缩类型\(type)")
            return false
        }
        return true
    }
    
    func decompress(path: ModelZipPath) -> Bool {
        let url = URL(fileURLWithPath: path.srcFilePath)
        let type = url.pathExtension
        
        if type.lowercased() == "zip" {
            zipModel.decompress(path: path)
        } else if type.lowercased() == "rar" {
            rarModel.decompress(path: path)
        } else if type.lowercased() == "7z" {
            zModel.decompress(path: path)
        } else {
            print("不支持压缩类型\(type)")
            return false
        }
        return true
    }
}

let facade = CompressionFacade()
facade.compress(path: ("./压缩外观模式.md", "./压缩外观模式"), type: "zip")
facade.decompress(path: ("./解压外观模式.zip", "./解压外观模式"))

print("\n")
facade.compress(path: ("./压缩外观模式.pdf", "./压缩外观模式"), type: "rar")
facade.decompress(path: ("./解压外观模式.rar", "./解压外观模式"))

print("\n")
facade.compress(path: ("./压缩外观模式.odc", "./压缩外观模式"), type: "7z")
facade.decompress(path: ("./解压外观模式.7z", "./解压外观模式"))
