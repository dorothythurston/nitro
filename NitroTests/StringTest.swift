import XCTest
import Foundation
@testable import Nitro

class StringTest: XCTestCase {
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testIsValidPassword() {
        XCTAssertFalse("ssss".isValidPasswordFormat())
        XCTAssertFalse("11111".isValidPasswordFormat())
        XCTAssertFalse("1234567890123456789012345678901234567890hH".isValidPasswordFormat())
        XCTAssertFalse("ed1212".isValidPasswordFormat())
        XCTAssert("Ed12".isValidPasswordFormat())
    }
    
    func testIsValidEmail() {
        XCTAssertFalse("ssss".isValidEmailFormat())
        XCTAssertFalse("11111".isValidEmailFormat())
        XCTAssertFalse("111@$$.com".isValidEmailFormat())
        XCTAssertFalse("elcat@@ed.com".isValidEmailFormat())
        XCTAssert("ed@ed.com".isValidEmailFormat())
    }
}