import Foundation
import XCTest

class PollfishIOSSDKUITestCase: UITestCaseBase
{
    private lazy var pollfishiOSSDKView = PollfishIOSSDKUITestView(app: app)

    override func setUp()
    {
        super.setUp()
    }
    
    func testPollfishiOSSdkShowingAddedBaseView()
    {
        pollfishiOSSDKView.usePollfishiOSSDKButton.tap()
        
        XCTAssert(pollfishiOSSDKView.isVisible)
    }
    
    func testPollfishiOSSdkShowingWebView()
    {
        pollfishiOSSDKView.usePollfishiOSSDKButton.tap()
        pollfishiOSSDKView.waitUntilHittable(element: pollfishiOSSDKView.closeButton)
        
        XCTAssert(pollfishiOSSDKView.closeButton.exists)
    }
    
    func testPollfishiOSSdkWebviewCloseButtonWorking()
    {
        pollfishiOSSDKView.usePollfishiOSSDKButton.tap()
        pollfishiOSSDKView.waitUntilHittable(element: pollfishiOSSDKView.closeButton)
        pollfishiOSSDKView.closeButton.tap()
        
        XCTAssert(pollfishiOSSDKView.isVisible)
    }
    
    func testPollfishiOSSdkWebviewParam1Showing()
    {
        pollfishiOSSDKView.usePollfishiOSSDKButton.tap()
        pollfishiOSSDKView.waitUntilHittable(element: pollfishiOSSDKView.closeButton)
        
        XCTAssert(pollfishiOSSDKView.testParamLabel1.exists)
    }
    
    func testPollfishiOSSdkWebviewParam2Showing()
    {
        pollfishiOSSDKView.usePollfishiOSSDKButton.tap()
        pollfishiOSSDKView.waitUntilHittable(element: pollfishiOSSDKView.closeButton)
        
        XCTAssert(pollfishiOSSDKView.testParamLabel2.exists)
    }
    
    //MARK:- UITests for SceneDelegate Case
    
    func testPollfishiOSSdkShowingAddedBaseViewWindow()
    {
        sleep(5)
        pollfishiOSSDKView.usePollfishiOSSDKWindowButton.tap()
        
        XCTAssert(pollfishiOSSDKView.closeButton.exists)
    }
    
    func testPollfishiOSSdkShowingWebViewWindow()
    {
        sleep(5)
        pollfishiOSSDKView.usePollfishiOSSDKWindowButton.tap()
        pollfishiOSSDKView.waitUntilHittable(element: pollfishiOSSDKView.closeButton)
        
        XCTAssert(pollfishiOSSDKView.closeButton.exists)
    }
    
    func testPollfishiOSSdkWebviewCloseButtonWorkingWindow()
    {
        sleep(5)
        pollfishiOSSDKView.usePollfishiOSSDKWindowButton.tap()
        pollfishiOSSDKView.closeButton.tap()
        
        XCTAssert(pollfishiOSSDKView.usePollfishiOSSDKWindowButton.exists)
    }
    
    func testPollfishiOSSdkWebviewParam1ShowingWindow()
    {
        sleep(5)
        pollfishiOSSDKView.usePollfishiOSSDKWindowButton.tap()
        
        XCTAssert(pollfishiOSSDKView.testParamLabel1.exists)
    }
    
    func testPollfishiOSSdkWebviewParam2ShowingWindow()
    {
        sleep(5)
        pollfishiOSSDKView.usePollfishiOSSDKWindowButton.tap()
        
        XCTAssert(pollfishiOSSDKView.testParamLabel2.exists)
    }

}
