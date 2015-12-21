import XCTest
@testable import Nitro

class AuthenticationViewControllerUITests: XCTestCase {
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCorrectLoginCredentialsEnablesContinueButton() {
        let app = XCUIApplication()
        let signInElementsQuery = XCUIApplication().otherElements.containingType(.Button, identifier:"sign in")
        let textField = signInElementsQuery.childrenMatchingType(.TextField).elementBoundByIndex(0)
        textField.tap()
        textField.typeText("d@d.com")
        
        let textField2 = signInElementsQuery.childrenMatchingType(.TextField).elementBoundByIndex(1)
        textField2.tap()
        textField2.typeText("b1H")
        
        XCTAssert(app.buttons["sign in"].enabled)
    }
    
    func testIncorrectLoginCredentialsDoesNotEnableContinueButton() {
        let app = XCUIApplication()
        XCTAssertFalse(app.buttons["sign in"].enabled)
        let signInElementsQuery = app.otherElements.containingType(.Button, identifier:"sign in")
        let textField = signInElementsQuery.childrenMatchingType(.TextField).elementBoundByIndex(0)
        textField.tap()
        textField.typeText("notanemail")
        let textField2 = signInElementsQuery.childrenMatchingType(.TextField).elementBoundByIndex(1)
        textField2.tap()
        textField2.typeText("bad")
        XCTAssertFalse(app.buttons["sign in"].enabled)
        
        textField.tap()
        textField.typeText("@email.com")
        XCTAssertFalse(app.buttons["sign in"].enabled)
    }
}
