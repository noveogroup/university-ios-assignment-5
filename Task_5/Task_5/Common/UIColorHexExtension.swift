//
//  UIColorHexExtension.swift
//  Task_5
//
//  Created by Kirill Asyamolov on 10/11/16.
//  Copyright © 2016 Kirill Asyamolov. All rights reserved.
//

import UIKit

let hexCharactersSet = "0123456789ABCDEF"
let hexColorSymbolsCount = 6

extension UIColor {
    
    public convenience init?(hexString: String) {
        let r, g, b, a: CGFloat
        
        if hexString.hasPrefix("#") {
            let start = hexString.index(hexString.startIndex, offsetBy: 1)
            let hexColor = hexString.substring(from: start)
            
            if hexColor.characters.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255
                    
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        
        return nil
    }
    
    public func hex() -> String {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        
        getRed(&r, green: &g, blue: &b, alpha: &a)
        let rgb:Int = (Int)(r * 255) << 16 | (Int)(g * 255) << 8 | (Int)(b * 255) << 0
        
        return String(format: "%06x", rgb)
    }
    
    public static func validHexString(_ hexString: String) -> Bool {
        let uppercasedString = hexString.uppercased()
        let characterSet = CharacterSet(charactersIn: hexCharactersSet).inverted
        let filteredString = uppercasedString.components(separatedBy: characterSet).joined()
        return (uppercasedString.characters.count <= hexColorSymbolsCount) && (uppercasedString == filteredString)
        //probably this way co
/*
        let stringInUpperCase = hexString.uppercased()
        let charsCount = stringInUpperCase.characters.count
        return charsCount <= hexColorSymbolsCount &&
            hexString.range(of: "\\[0-9A-F]{\(charsCount)}\\", options: .regularExpression) != nil
*/
    }
    
    public func getComponents() -> Array<Float> {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        
        getRed(&r, green: &g, blue: &b, alpha: &a)
        
        return [r, g, b, a].map(Float.init)
    }
}
