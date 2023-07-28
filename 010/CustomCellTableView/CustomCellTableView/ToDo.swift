//
//  ToDo.swift
//  CustomCellTableView
//
//  Created by JunHwan Kim on 2023/07/28.
//

struct ToDo {
    var main: String
    var sub: String
    var like: Bool
    var done: Bool
}

struct ToDoInformation {
    
    var list: [ToDo] = [
        ToDo(main: "잠자기", sub: "23.01.23", like: false, done: true),
        ToDo(main: "쉬기", sub: "23.03.23", like: true, done: false),
        ToDo(main: "게임", sub: "23.02.23", like: false, done: false),
        ToDo(main: "놀기", sub: "23.04.23", like: true, done: true)]
    
    var listCount: Int {
        return list.count
    }
}
