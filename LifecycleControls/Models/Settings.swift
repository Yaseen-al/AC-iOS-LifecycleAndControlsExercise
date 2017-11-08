//
//  Settings.swift
//  LifecycleControls
//
//  Created by C4Q on 11/7/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation

enum TextCase:String {
    case lower, upper, capital
}

struct Settings {
    static var numberOfRows: Int = 0
    static var alternatingCell: Bool = false
    static var red:Float = 1
    static var green:Float = 1
    static var blue:Float = 1
    static var font: String = "arial"
    static var textCase: TextCase = .lower
}
