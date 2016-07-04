//
//  UIColor+Hexa.swift
//  tryCat
//
//  The MIT License (MIT)
//
//  Copyright (c) 2016 Guillermo RD
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import Foundation
import UIKit

public extension UIColor {
    public convenience init?(hexaStr: String, alpha: Float) {
        var hexaStr = hexaStr;

        if hexaStr.hasPrefix("#") {
            hexaStr = hexaStr.substringFromIndex(hexaStr.startIndex.advancedBy(1))
        }

        if (hexaStr.rangeOfString("(^([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$)", options: .RegularExpressionSearch) != nil) {

            if (hexaStr.characters.count == 3) {
                var hexaAux = ""
                for i in hexaStr.characters {
                    hexaAux = hexaAux + String(i) + String(i)
                }

                hexaStr = hexaAux
            }

            var hexaList: [String] = []

            var i = 2
            while i <= hexaStr.characters.count {
                hexaList.append(hexaStr.substringWithRange(Range<String.Index>(hexaStr.startIndex.advancedBy(i - 2) ..< hexaStr.startIndex.advancedBy(i))))
                i = i + 2
            }

            let rDec = UInt8(strtoul(hexaList[0], nil, 16))
            let gDec = UInt8(strtoul(hexaList[1], nil, 16))
            let bDec = UInt8(strtoul(hexaList[2], nil, 16))

            self.init(red: CGFloat(rDec) / 255.0,
                      green: CGFloat(gDec) / 255.0,
                      blue: CGFloat(bDec) / 255.0,
                      alpha: CGFloat(alpha))
        }
        else {
            self.init()
            return nil
        }
    }
}
