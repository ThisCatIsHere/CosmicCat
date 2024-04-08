//
//  Extensions.swift
//  CosmicCat
//
//  Created by Sarah Huth on 26.03.24.
//

import SwiftUI

extension UIVisualEffectView {
    var backDrop: UIView? {
        return subView(forClass: NSClassFromString("_UIVisualEffectBackdropView"))
    }
    
    var gaussianBlur: NSObject? {
        return backDrop?.value(key: "filters", filter: "gaussianBlur")
    }
    
    var saturation: NSObject? {
        return backDrop?.value(key: "filters", filter: "colorSaturate")
    }
    
    var gaussianBlurRadius: CGFloat {
        get {
            return gaussianBlur?.values?["inputRadius"] as? CGFloat ?? 0
        }
        set {
            gaussianBlur?.values?["inputRadius"] = newValue
            applyNewEffects()
        }
    }
    
    func applyNewEffects() {
        UIVisualEffectView.animate(withDuration: 0.5) {
            self.backDrop?.perform(Selector(("applyRequestedFilterEffects")))
        }
    }
    
    var saturationAmount: CGFloat {
        get {
            return saturation?.values?["inputAmount"] as? CGFloat ?? 0
        }
        set {
            saturation?.values?["inputAmount"] = newValue
            applyNewEffects()
        }
    }
}

extension UIView {
    func subView(forClass: AnyClass?) -> UIView? {
        return subviews.first { view in
            type(of: view) == forClass
        }
    }
}

extension NSObject {
    var values: [String: Any]? {
        get {
            return value(forKeyPath: "requestedValues") as? [String: Any]
        }
        set {
            setValue(newValue, forKeyPath: "requestedValues")
        }
    }
    
    func value(key: String, filter: String) -> NSObject? {
        (value(forKey: key) as? [NSObject])?.first(where: { obj in
            return obj.value(forKeyPath: "filterType") as? String == filter
        })
    }
}
