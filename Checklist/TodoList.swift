//
//  TodoList.swift
//  Checklist
//
//  Created by Mauricio Barbosa on 22/08/19.
//  Copyright © 2019 Mauricio Barbosa. All rights reserved.
//

import Foundation

class TodoList {
    private var items: [ChecklistItem] = []
    var size: Int {
        return items.count
    }
    
    let defaultTitles = ["New todo item",
                  "Generic todo",
                  "Fill me out",
                  "I need something todo",
                  "Much todo about nothing"]
    
    init(with size: Int = 5) {
        for index in 0..<size {
            let label = self.getLabel(index % 5)
            items.append(ChecklistItem(with: label))
        }
    }
    
    func getItem(at index: Int) -> ChecklistItem {
        return items[index]
    }
    
    func removeItem(at index: Int) {
        if (items.count > index) {
            items.remove(at: index)
        }
    }
    
    private func getLabel(_ index: Int) -> String {
        switch index {
        case 0:
            return "Take a jog"
        case 1:
            return "Watch a movie"
        case 2:
            return "Code an app"
        case 3:
            return "Walk the dog"
        default:
            return "Study design patterns"
        }
    }
    
    func newItem() -> ChecklistItem {
        let newItem = ChecklistItem(with: getRandomDescription(), true)
        items.append(newItem)
        return newItem
    }
    
    private func getRandomDescription() -> String {
        let selectedIndex = Int.random(in: 0 ... defaultTitles.count - 1)
        return defaultTitles[selectedIndex]
    }
}
