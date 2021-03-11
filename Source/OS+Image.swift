//
//  OS+Image.swift
//  Created by Alexis Akers on 3/11/21.
//

#if os(macOS)
import AppKit
public typealias RSCodeImage = NSImage
#elseif os(iOS)
import UIKit
public typealias RSCodeImage = UIImage
#endif
