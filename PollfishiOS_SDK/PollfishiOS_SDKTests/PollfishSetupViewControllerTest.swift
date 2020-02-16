import XCTest
@testable import PollfishiOS_SDK

class PollfishSetupViewControllerTest: XCTestCase
{
    var pollfishSetupViewController: PollfishSetupViewController!
    var parameters = Param(param1: "test1", param2: "test2", param3: "test3", param4: "test4", param5: "test5")
    
    override func setUp()
    {
        pollfishSetupViewController = PollfishSetupViewController.newInstance(parentViewController: UIViewController())
        pollfishSetupViewController.delegate = self
    }

    func test_isPanelLaunchingCallBackWorking()
    {
        pollfishSetupViewController.delegate?.panelLaunching()
    }
    
    func test_isPanelClosingCallBackWorkingWithParameters()
    {
        pollfishSetupViewController.parameters = parameters
        pollfishSetupViewController.delegate?.panelClosing(param3: parameters.param3, param4: parameters.param4, param5: parameters.param5)
    }
}

extension PollfishSetupViewControllerTest: PollfishSetupViewDelegate
{
    func panelLaunching()
    {
        XCTAssert(true)
    }
    
    func panelClosing(param3: String, param4: String, param5: String)
    {
        XCTAssertEqual(param3, parameters.param3)
        XCTAssertEqual(param4, parameters.param4)
        XCTAssertEqual(param5, parameters.param5)
    }
}
