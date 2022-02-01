//
//  Test.swift
//  MovieList
//
//  Created by Василий Пронин on 26.01.2022.
//

struct Test {
    
    let title: String
    
    static func getTests() -> [Test] {
        
        var tests: [Test] = []
        
        let titles = NetworkManager.shared.titles
    
        for i in 0..<titles.count {
            let test = Test(title: titles[i])
            tests.append(test)
        }
        
        return tests
    }
}
