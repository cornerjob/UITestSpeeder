//
//  XCTestCase+CJTools.swift
//  CornerJob
//
//  Created by Jesus Lopez on 30/05/2017.
//  Copyright © 2017 Clapp Studios. All rights reserved.
//

import XCTest

public extension XCTestCase {
    
    public func waitForExist(object:Any, timeout:ExpectationTimeout = .Default, file:String=#file, line:Int=#line, continueIfFail: Bool = false){
        self.expectation(for: NSPredicate(format: "exists = 1"), evaluatedWith: object)
        self.waitForExpectations(timeout: timeout.rawValue) { (error) in
            if (error != nil) {
                let messsage = "Failed to find \(object) after \(timeout.rawValue) seconds"
                self.recordFailure(withDescription: messsage, inFile: file, atLine: line, expected: true)
                if (!continueIfFail) {
                    XCTFail()
                }
            }
        }
    }
    
}
