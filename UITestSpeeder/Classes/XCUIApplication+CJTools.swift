//
//  XCUIApplication+CJTools.swift
//  CornerJob
//
//  Created by Jesus Lopez on 29/05/2017.
//  Copyright © 2017 Clapp Studios. All rights reserved.
//

import XCTest

public enum ExpectationTimeout: TimeInterval {
    case Short = 5
    case Default = 10
    case Long = 20
}


public extension XCUIApplication {

    //MARK: Find
    public func findSearchField(placeholder:String, timeout: ExpectationTimeout = .Long) -> XCUIElement {
        let context = XCTestCase()
        let searchField = XCUIApplication().searchFields.element(matching:NSPredicate(format: "placeholderValue = \"\(placeholder)\" OR identifier = \"\(placeholder)\""))
        context.waitForExist(object: searchField, timeout: timeout)
        return searchField
    }
    
    
    public func findTextField(placeholder: String, timeout: ExpectationTimeout = .Default) -> XCUIElement {
        let context = XCTestCase()
        let textField = XCUIApplication().textFields.element(matching:NSPredicate(format: "placeholderValue = \"\(placeholder)\" OR identifier = \"\(placeholder)\""))
        context.waitForExist(object: textField, timeout: timeout)
        return textField
    }
    
    public func findSecureTextField(placeholder: String, timeout: ExpectationTimeout = .Default) -> XCUIElement {
        let context = XCTestCase()
        let secureTextField = XCUIApplication().secureTextFields.element(matching:NSPredicate(format: "placeholderValue = \"\(placeholder)\" OR identifier = \"\(placeholder)\""))
        context.waitForExist(object: secureTextField, timeout: timeout)
        return secureTextField
    }
    
    public func findButton(label: String, timeout: ExpectationTimeout = .Default, continueIfFail:Bool = false) -> XCUIElement {
        let context = XCTestCase()
        let button = XCUIApplication().buttons.element(matching:NSPredicate(format: "label = \"\(label)\" OR identifier = \"\(label)\""))
        context.waitForExist(object: button, timeout: timeout, continueIfFail: continueIfFail)
        return button
    }
    
    public func findButtons(label: String) -> XCUIElementQuery {
        let buttons = XCUIApplication().buttons.matching(NSPredicate(format: "label = \"\(label)\" OR identifier = \"\(label)\""))
        return buttons
    }
    
    public func findStaticText(value: String, timeout: ExpectationTimeout = .Default) -> XCUIElement {
        let context = XCTestCase()
        let staticTextElement = XCUIApplication().staticTexts[value]
        context.waitForExist(object: staticTextElement, timeout: timeout)
        return staticTextElement
    }
    
    public func findFirstTableView(timeout: ExpectationTimeout = .Default) -> XCUIElement {
        let context = XCTestCase()
        let table = XCUIApplication().tables.element(boundBy: 0)
        context.waitForExist(object: table, timeout: timeout)
        return table
    }

    public func findOther(identifier: String, timeout: ExpectationTimeout = .Default) -> XCUIElement {
        let context = XCTestCase()
        let otherElement = XCUIApplication().otherElements.element(matching: .other, identifier: identifier)
        context.waitForExist(object: otherElement, timeout: timeout)
        return otherElement
    }
    
    public func findAlert(timeout: ExpectationTimeout = .Long) -> XCUIElement {
        let alertsElement = XCUIApplication().alerts; ///.element(matching:NSPredicate(format: "placeholderValue = \"\(placeholder)\" OR identifier = \"\(placeholder)\""))
        return alertsElement.element(boundBy: 0);
    }
    
    public func findSheet(timeout: ExpectationTimeout = .Default) -> XCUIElement {
        return XCUIApplication().sheets.element(boundBy: 0);
    }

    public func findImage(identifier: String, timeout: ExpectationTimeout = .Default) -> XCUIElement {
        let context = XCTestCase()
        let imageElement = XCUIApplication().images.element(matching: .image, identifier: identifier)
        context.waitForExist(object: imageElement, timeout: timeout)
        return imageElement
    }

    public func findTableContainingLabel(label: String, timeout: ExpectationTimeout = .Default, index: UInt? = nil) -> XCUIElement {

        let table:XCUIElement

        if let boundIndex = index {
            table = XCUIApplication().tables.staticTexts.matching(NSPredicate(format: "label CONTAINS '\(label)'")).element(boundBy: boundIndex)
        } else {
            table = XCUIApplication().tables.staticTexts.matching(NSPredicate(format: "label CONTAINS '\(label)'")).element(boundBy: 0)
        }

        return table
    }
    
    public func findTableview(identifier: String, timeout: ExpectationTimeout = .Default, continueIfFail:Bool = false) -> XCUIElement {
        let context = XCTestCase()
        let tableview = XCUIApplication().tables.element(matching: .table, identifier: identifier)
        context.waitForExist(object: tableview, timeout: timeout, continueIfFail: continueIfFail)
        return tableview
    }
    
    public func findTextView(placeholder: String, timeout: ExpectationTimeout = .Default) -> XCUIElement {
        let context = XCTestCase()
        let textView = XCUIApplication().textViews.element(matching:NSPredicate(format: "placeholderValue = \"\(placeholder)\" OR identifier = \"\(placeholder)\""))
        context.waitForExist(object: textView, timeout: timeout)
        return textView
    }
    
    public func findCellWithIndex (index:UInt, timeout: ExpectationTimeout = .Default, continueIfFail:Bool = false) -> XCUIElement {
        let context = XCTestCase()
        let cellview = XCUIApplication().cells.element(boundBy: index)
        context.waitForExist(object: cellview, timeout: timeout, continueIfFail: continueIfFail)
        return cellview
    }

    //MARK: Typing
    
    public func typeSearchField(placeholder:String, value:String, clear:Bool = true, timeout: ExpectationTimeout = .Default) {
        let searchField = findSearchField(placeholder: placeholder, timeout: timeout)
        searchField.tap()
        if (clear) {
            clearTextSearch(searchField: searchField)
        }
        searchField.typeText(value)
    }
    
    
    public func typeTextField(placeholder:String, value:String, timeout: ExpectationTimeout = .Default) {
        let textField = findTextField(placeholder: placeholder, timeout: timeout)
        textField.tap()
        textField.typeText(value)
    }
    
    public func typeSecureTextField(placeholder: String, value: String, timeout: ExpectationTimeout = .Default) {
        let secureTextField = findSecureTextField(placeholder: placeholder, timeout: timeout)
        secureTextField.tap()
        secureTextField.typeText(value)
    }
    
    public func typeTextView(placeholder:String, value:String, timeout: ExpectationTimeout = .Default) {
        let textView = findTextView(placeholder: placeholder, timeout: timeout)
        textView.tap()
        textView.typeText(value)
    }
    
    public func tapButton(label: String, timeout: ExpectationTimeout = .Default) {
        let button = findButton(label: label, timeout: timeout)
        button.tap()
    }
    
    public func tapButtonWithIndex(label:String, index:UInt) {
        let buttons = findButtons(label: label)
        buttons.element(boundBy: index).tap()
    }
    
    public func tapNavigationBackButton() {
        XCUIApplication().navigationBars.buttons.element(boundBy: 0).tap()
    }
    
    public func tapCellWithIndex (index:UInt) {
        XCUIApplication().cells.element(boundBy: index).tap()
    }

    public func isButtonWithIndexEnabled (label:String, index:UInt) -> Bool {
        let buttons = findButtons(label: label)
        return buttons.element(boundBy: index).isEnabled
    }
    
    public func typeKeyboardIntro() {
        XCUIApplication().keyboards.buttons["Return"].tap()
    }
    
    public func typeKeyboardNext() {
        XCUIApplication().keyboards.buttons["Next"].tap()
    }
    
    public func typeKeyboardSearch() {
        XCUIApplication().keyboards.buttons["Search"].tap()
    }
    
    public func clearTextSearch(searchField:XCUIElement) {
        while (searchField.value as! String).characters.count != 0 {
            XCUIApplication().keyboards.keys["delete"].tap()
        }
    }
    
    //Mark: Alerts
    
    public func tapAlertOption(value: String, timeout: ExpectationTimeout = .Default) {
        let alert = findAlert()
        alert.buttons[value].tap()
    }

    // MARK: - Sheets
    public func tapSheetOption(index: UInt, timeout: ExpectationTimeout = .Default) {
        findSheet().buttons.element(boundBy: index).tap()
    }

    public func tapSheetOption(label: String, timeout: ExpectationTimeout = .Default) {
        findSheet().buttons[label].tap()
    }
    
    // MARK: - UIPopover
    public func dismissPopoverController() {
        children(matching: .window).element(boundBy: 0).tap()
    }

}
