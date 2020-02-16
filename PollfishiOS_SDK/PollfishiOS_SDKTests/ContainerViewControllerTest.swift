import XCTest
@testable import PollfishiOS_SDK

class ContainerViewControllerTest: XCTestCase
{
    var containerViewController: ContainerViewController!
    var presenter: ContainerViewPresenter!
    var requestUrlString = "https://www.pollfish.com"
    
    override func setUp()
    {
        presenter = ContainerViewPresenter(view: self)
    }

    func test_isRequestCreated()
    {
        presenter.viewDidLoad(requestUrl: requestUrlString)
    }
    
    func test_isAbleToFetchAdvertisingId()
    {
        containerViewController = ContainerViewController.newInstance(delegate: nil, param: Param())
        let id = containerViewController.identifierForAdvertising()
        
        XCTAssertTrue(id != "00000000-0000-0000-0000-000000000000")
    }
}

extension ContainerViewControllerTest: ContainerViewPresenterView
{
    func loadWebView(request: URLRequest)
    {
        XCTAssertTrue(request.url?.absoluteString == requestUrlString)
    }
}
