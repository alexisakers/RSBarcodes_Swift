//
//  File 3.swift
//  
//
//  Created by Alexis Akers on 3/11/21.
//

import Foundation

#if os(macOS)
public enum RSCodeContentMode {
    case scaleToFill
    case scaleAspectFill
    case scaleAspectFit
    case redraw
    case center
    case top
    case bottom
    case right
    case left
    case topLeft
    case topRight
    case bottomLeft
    case bottomRight
}
#elseif os(iOS)
import UIKit
public typealias RSCodeContentMode = UIView.ContentMode
#endif
