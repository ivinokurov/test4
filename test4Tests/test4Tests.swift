//
//  test4Tests.swift
//  test4Tests
//
//  Created by И.В. Винокуров 
//

import XCTest
@testable import test4

class test4Tests: XCTestCase {
    
    var login: String? = nil
    var viewController = ViewController()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        login = "ivinokurov"
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testEmail() throws {
        XCTAssertTrue(viewController.isEmail(login: self.login!), "Не Email")
    }
    
    func testLength() throws {
        XCTAssertTrue(viewController.validateLength(login: self.login!), "Вне диапазона 3...32 символа")
    }
    
    func testValidSymbols() throws {
        XCTAssertTrue(viewController.validateAllSymbols(login: self.login!), "Содержит недопустимые символы")
    }
    
    func testFirstSymbols() throws {
        XCTAssertTrue(viewController.validateFirstSymbols(login: self.login!), "Начинается с недопустимых символов")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
