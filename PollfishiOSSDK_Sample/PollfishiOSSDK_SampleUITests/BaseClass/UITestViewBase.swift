import XCTest

class UITestViewBase {
    var app: XCUIApplication

    required init(app: XCUIApplication)
    {
        self.app = app
    }
    
    func waitUntilDoesNotExist(element: XCUIElement)
    {
        waitUntilPredicate(element: element, predicate: NSPredicate(format: "exists == false"))
    }
    
    func waitUntilEnabled(element: XCUIElement)
    {
        waitUntilPredicate(element: element, predicate: NSPredicate(format: "isEnabled == true"))
    }
    
    func waitUntilExists(element: XCUIElement)
    {
        waitUntilPredicate(element: element, predicate: NSPredicate(format: "exists == true"))
    }
    
    func waitUntilHittable(element: XCUIElement)
    {
        waitUntilPredicate(element: element, predicate: NSPredicate(format: "isHittable == true"))
    }
    
    private func waitUntilPredicate(element: XCUIElement, predicate: NSPredicate)
    {
        let expectation = XCTNSPredicateExpectation(predicate: predicate, object: element)
        
        let result = XCTWaiter.wait(for: [expectation], timeout: 80)
        
        if(result == .timedOut)
        {
            XCTFail(expectation.description)
        }
    }
}
