import XCTest

class PollfishIOSSDKUITestView: UITestViewBase
{
    lazy var closeButton = app.buttons["closeButton"]
    lazy var usePollfishiOSSDKButton = app.buttons["UsePollfishiOSSDKButton"]
    lazy var usePollfishiOSSDKWindowButton = app.buttons["UsePollfishiOSSDKWindowButton"]
    lazy var isVisible = app.staticTexts["sampleFunctionality"].exists
    lazy var testParamLabel1 = app.staticTexts["Test param 1"]
    lazy var testParamLabel2 = app.staticTexts["Test param 2"]
}



