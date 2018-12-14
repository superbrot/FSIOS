//
//  ThemeManager.swift
//  Yatodoa
//
//  Created by Alex on 30.05.18.
//  Copyright © 2018 Alexander Dobrynin. All rights reserved.
//

import UIKit

fileprivate extension Theme {
    
    var tintColor: UIColor {
        switch self {
        case .colorful: return .yatodoaBrown
        case .standard: return #colorLiteral(red:0.00, green:0.48, blue:1.00, alpha:1.0)
        case .dark: return UIColor.gray
        }
    }
    
    var navigationBarBackgroundColor: UIColor? {
        switch self {
        case .colorful: return .yatodoaBrown
        case .standard: return nil
            case .dark: return UIColor.darkGray
        }
    }
    
    var navigationBarTintColor: UIColor? {
        switch self {
        case .colorful: return .white
        case .standard: return tintColor
            case .dark: return .white
        }
    }
    
    var navigationBarTextColor: UIColor {
        switch self {
        case .colorful: return .white
        case .standard: return .black
            case .dark: return .white
        }
    }
    
    var positiveColor: UIColor? {
        switch self {
        case .colorful: return .yatodoaGreen
        case .standard: return nil
            case .dark: return .blue
        }
    }
    
    var labelColor: UIColor? {
        switch self {
        case .standard: return nil
        case .colorful: return .yatodoaBrown
            case .dark: return UIColor.lightGray
        }
    }
    
    var secondaryTextColor: UIColor? {
        switch self {
        case .standard: return nil
        case .colorful: return .yatodoaRed
        case .dark: return nil
        }
    }
    
    var checkbox: Checkbox {
        switch self {
        case .standard: return Checkbox(checkmarkColor: .black, borderColor: nil)
        case .colorful: return Checkbox(checkmarkColor: .yatodoaGreen, borderColor: .yatodoaGreen)
        case .dark: return Checkbox(checkmarkColor: .black, borderColor: nil)
        }
    }
}

class ThemeManager {
    private init() {}
    
    static var current: Theme = .standard {
        didSet { apply(current) }
    }
    
    private static func apply(_ theme: Theme) {
        print("apply \(theme)")
        
        // apply global tint color
        UIApplication.shared.delegate?.window??.tintColor = theme.tintColor
        
        // navigation
        UINavigationBar.appearance().barTintColor = theme.navigationBarBackgroundColor // background color
        UINavigationBar.appearance().tintColor = theme.navigationBarTintColor // tint color
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor: theme.navigationBarTextColor] // text color
        
        // switch
        UISwitch.appearance().onTintColor = theme.positiveColor?.withAlphaComponent(0.5)
        UISwitch.appearance().thumbTintColor = theme.positiveColor
        
        // header footer view
        UILabel.appearance(whenContainedInInstancesOf: [UITableViewHeaderFooterView.self, DetailTodoTableViewController.self]).textColor = theme.labelColor
        
        // checkbox
        TDCheckbox.appearance().checkbox = theme.checkbox
        
        // AddTodoView
        UIButton.appearance(whenContainedInInstancesOf: [AddTodoView.self]).setTitleColor(theme.positiveColor, for: .normal)
        
        // TodoCell
        UILabel.appearance(whenContainedInInstancesOf: [ToDoTableViewCell.self]).textColor = theme.secondaryTextColor
    }
}