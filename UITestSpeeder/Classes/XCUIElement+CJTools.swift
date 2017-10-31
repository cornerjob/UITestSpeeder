//
//  XCUIElement+CJTools.swift
//  CornerJob
//
//  Created by Abel Fernandez on 14/08/2017.
//  Copyright © 2017 Clapp Studios. All rights reserved.
//


import XCTest

public extension XCUIElement {
    
    // MARK: - Actions
    public func tapOnCell(index: Int) {
        self.cells.element(boundBy: index).coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.5)).tap()
    }
    
    public func scrollToElement(element: XCUIElement) {
        while !element.visible() {
            swipeUp()
        }
        
        // Account for tabBar
        let tabBar = XCUIApplication().tabBars.element(boundBy: 0)
        if (tabBar.visible()) {
            while element.frame.intersects(tabBar.frame) {
                swipeUp()
            }
        }
    }
    
    public func visible() -> Bool {
        guard self.exists && !self.frame.isEmpty else { return false }
        return XCUIApplication().windows.element(boundBy: 0).frame.contains(self.frame)
    }
    
    
}
