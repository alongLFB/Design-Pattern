//
//  main.swift
//  Filter
//
//  Created by lialong on 22/03/2022.
//

import Foundation

print("Hello, World!")

import Foundation

/// 过滤器接口
protocol Filter {
    associatedtype T
    func filter(items: [T]) -> [T]
}


/// 过滤器链,它可以包含多个过滤器，并管理这些过滤器
class FilterChain<F> where F: Filter {
        
    private var filters: [F] = []
    
    init() {}
    
    func addFilter(_ filter: F) {
        self.filters.append(filter)
    }
    
    func filter(items: [F.T]) -> [F.T] {
        var items: [F.T] = items
        for filter in filters {
            items = filter.filter(items: items)
        }
        return items
    }
}

class StringFilter: Filter {
    typealias T = String
    func filter(items: [String]) -> [String] {
        return items
    }
}

/// 敏感词汇过滤
class SensitiveFilter: StringFilter {
    
    private var sensitives: [String] = ["黄色", "反动", "贪污", "造谣"]
        
    override func filter(items: [String]) -> [String] {
        var result: [String] = []
        // 对每个元素进行过滤
        for ele in items {
            var str = ele
            self.sensitives.forEach { (sen) in
                if str.contains(sen) {
                    str = str.replacingOccurrences(of: sen, with: "")
                }
            }
            result.append(str)
        }
        return result
    }

}

class HtmlFilter: StringFilter {
    
    private let wordMap: [String: String] = [
        "&" : "&amp;",
        "'": "&apos;",
        ">": "&gt;",
        "<": "&lt;",
        "\"": "&quot;"
    ]
    
    override func filter(items: [String]) -> [String] {
        var result: [String] = []
        
        for ele in items {
            var str = ele
            self.wordMap.forEach { (key, value) in
                str = str.replacingOccurrences(of: key, with: value)
            }
            result.append(str)
        }
        return result
    }
    
}

extension String {
    subscript(_ indexs: Range<Int>) -> String {
        let beginIndex = index(startIndex, offsetBy: indexs.lowerBound)
        let endIndex = index(startIndex, offsetBy: indexs.upperBound)
        return String(self[beginIndex..<endIndex])
    }
}

let contents = [
    "有人出售黄色书:<黄青味道>",
    "有人企图搞反动活动，————“造谣咨询”"
]

print("过滤前的内容: \(contents)")

let filterChain = FilterChain<StringFilter>()
filterChain.addFilter(SensitiveFilter())
print("过滤SensitiveFilter后的内容：\(filterChain.filter(items: contents))")


filterChain.addFilter(HtmlFilter())

print("过滤HtmlFilter后的内容：\(filterChain.filter(items: contents))")




