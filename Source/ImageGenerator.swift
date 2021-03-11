//
//  ImageGenerator.swift
//  Created by Alexis Akers on 3/11/21.
//

#if os(iOS)
import UIKit
class ImageGenerator {
    let size: CGSize
    init(size: CGSize) {
        self.size = size
    }

    func image(builder: @escaping (CGContext) -> Void) -> RSCodeImage {
        UIGraphicsBeginImageContextWithOptions(size, true, UIScreen.main.scale)
        let context = UIGraphicsGetCurrentContext()!
        builder(context)
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
}

#elseif os(macOS)
import AppKit

class ImageGenerator {
    let size: CGSize
    init(size: CGSize) {
        self.size = size
    }

    func image(builder: @escaping (CGContext) -> Void) -> RSCodeImage {
        let bitmap = NSBitmapImageRep(
            bitmapDataPlanes: nil,
            pixelsWide: Int(size.width),
            pixelsHigh: Int(size.height),
            bitsPerSample: 8,
            samplesPerPixel: 4,
            hasAlpha: true,
            isPlanar: false,
            colorSpaceName: .deviceRGB,
            bitmapFormat: .alphaFirst,
            bytesPerRow: 0,
            bitsPerPixel: 0
        )!

        let context = NSGraphicsContext(bitmapImageRep: bitmap)!
        NSGraphicsContext.saveGraphicsState()
        NSGraphicsContext.current = context

        let cgContext = context.cgContext
        builder(cgContext)

        NSGraphicsContext.restoreGraphicsState()
        let image = NSImage(size: size)
        image.addRepresentation(bitmap)

        return image
    }
}

#endif
