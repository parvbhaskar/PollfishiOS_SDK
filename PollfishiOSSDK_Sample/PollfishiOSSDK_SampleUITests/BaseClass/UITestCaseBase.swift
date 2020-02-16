import XCTest

class UITestCaseBase: XCTestCase {
    var app: XCUIApplication!
        
    override func setUp()
    {
        super.setUp()
        
        // stop immediately when a failure occurs.
        continueAfterFailure = false
        
        app = XCUIApplication()
        
        launchApp()
    }
    
    override class func tearDown()
    {
        // Logout
    }
    
    func launchApp()
    {        
        app.launch()
    }
}
