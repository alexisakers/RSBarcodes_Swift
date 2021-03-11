//
//  RSCodeLayer.swift
//  RSBarcodesSample
//
//  Created by R0CKSTAR on 6/13/14.
//  Copyright (c) 2014 P.D.Q. All rights reserved.
//

#if os(macOS)
import AppKit
#endif

import QuartzCore

open class RSCodeLayer: CALayer {
    @objc var code: RSCodeImage?
    
    override open func draw(in ctx: CGContext) {
        if let code = self.code {
            ctx.saveGState()

            var bounds = self.bounds
            #if os(macOS)
            let cgImage = code.cgImage(forProposedRect: &bounds, context: .current, hints: nil)!
            #else
            let cgImage = code.cgImage!
            #endif

            ctx.draw(cgImage, in: bounds)
            ctx.restoreGState()
        }
    }
}

