import Foundation
import WebKit
import AdSupport

protocol ContainerViewProtocol: class
{
    func show()
    func close()
}

class ContainerViewController: UIBaseViewController
{
    static func newInstance(delegate: ContainerViewProtocol?, param: Param) -> ContainerViewController
    {
        let ret = ContainerViewController()
        
        ret.delegate = delegate
        ret.paramaters = param

        return ret
    }
    
    private weak var delegate: ContainerViewProtocol?
    private var paramaters:Param!

    private var advertisingIdentifierLabel:UILabelBase!
    private var cancleButton: UIButtonBase!
    private var firstParameter: UILabelBase!
    private var secondParameter: UILabelBase!
    private var webView: WKWebView!
    private var webViewDelegate: WebViewDelegate!
    
    private var presenter: ContainerViewPresenter!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        setup()
    }
    
    func setup()
    {
        presenter = ContainerViewPresenter(view: self)

        webViewDelegate = WebViewDelegate(controller: self)
        
        setupControls()
        setupConstraints()
        
        presenter.viewDidLoad(requestUrl: "https://www.pollfish.com")
    }
    
    private func setupControls()
    {
        webView = WKWebView()
        webView.setup
        {
            $0.navigationDelegate = webViewDelegate
            $0.backgroundColor = .red
            view.addSubview($0)
        }
        
        firstParameter = UILabelBase()
        firstParameter.setup
        {
            $0.text = paramaters.param1
            $0.textAlignment = .center
            view.addSubview($0)
        }

        cancleButton = UIButtonBase()
        cancleButton.setup
        {
            $0.addTarget(self, action: #selector(close), for: .touchUpInside)
            $0.setTitle("X", for: .normal)
            $0.accessibilityIdentifier = "closeButton"
            view.addSubview($0)
        }
                
        secondParameter = UILabelBase()
        secondParameter.setup
        {
            $0.text = paramaters.param2
            $0.textAlignment = .center
            view.addSubview($0)
        }
        
        advertisingIdentifierLabel = UILabelBase()
        advertisingIdentifierLabel.setup
        {
            $0.text = identifierForAdvertising() ?? ""
            $0.numberOfLines = 0
            $0.textAlignment = .center
            view.addSubview($0)
        }
    }
    
    @objc func close()
    {
        delegate?.close()
    }

    private func setupConstraints()
    {
        _ = webView.safeAnchorConstraints(with: view)
        
        _ = cancleButton.safeAnchorConstraints(left: view.safeAreaLayoutGuide.leftAnchor, leftConstant: Constraints.leftPaddingCancelButton, top: view.safeAreaLayoutGuide.topAnchor, topConstant: Constraints.topPaddingCancelButton)
        _ = cancleButton.sizeConstraints(size: Constraints.cancelButtonSize)
        
        _ = firstParameter.safeAnchorConstraints(left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, centerY: cancleButton.safeAreaLayoutGuide.centerYAnchor)
        _ = firstParameter.sizeConstraints(height: Constraints.paramHeight)
        
        _ = secondParameter.anchorConstraints(left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor)
        _ = secondParameter.sizeConstraints(height: Constraints.paramHeight)
        
        _ = advertisingIdentifierLabel.alignCenterConstraints(centerX: view.safeAreaLayoutGuide.centerXAnchor, centerY: view.safeAreaLayoutGuide.centerYAnchor)
        _ = advertisingIdentifierLabel.sizeConstraints(width: view.safeAreaLayoutGuide.widthAnchor)
    }
    
    func identifierForAdvertising() -> String?
    {
        // Check whether advertising tracking is enabled
        guard ASIdentifierManager.shared().isAdvertisingTrackingEnabled else { return nil }
        
        // Get and return IDFA
        return ASIdentifierManager.shared().advertisingIdentifier.uuidString
    }
}

extension ContainerViewController
{
    class WebViewDelegate: NSObject, WKNavigationDelegate
    {
        private weak var controller: ContainerViewController?
        
        init(controller: ContainerViewController)
        {
            self.controller = controller
        }
                
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!)
        {
            controller?.delegate?.show()
        }
    }
}

extension ContainerViewController: ContainerViewPresenterView
{
    func loadWebView(request: URLRequest)
    {
        webView.load(request)
    }
}
