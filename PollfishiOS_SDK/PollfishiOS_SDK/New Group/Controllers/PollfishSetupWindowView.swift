import UIKit

public class PollfishSetupWindowView
{
    static public func newInstance(parentViewController: UIWindow?, setupViewAtInitialization: Bool = false) -> PollfishSetupWindowView
    {
        let ret = PollfishSetupWindowView()
        
        ret.parentController = parentViewController
        ret.setupViewAtInitialization = setupViewAtInitialization
        
        return ret
    }
    
    private var parentController:UIWindow? = nil
    private var parentView = UIView()
    private var childController:UIViewController! = nil
    private var childAnimatingView = UIView()
    
    public var parameters = Param()
    private var isPanelShowing = false
    private var setupViewAtInitialization: Bool!
    private var isWebViewLoaded = false

    public weak var delegate: PollfishSetupViewDelegate?
    
    public func viewDidLoad()
    {
        setup()
    }
    
    private func addChildViewController(_ child: UIViewController, frame: CGRect? = nil) -> UIView?
    {
        if let frame = frame
        {
            child.view.frame = frame
        }
        
        parentController?.addSubview(child.view)
                
        return child.view
    }

    private func childAnimatingViewHideStatus(_ status:Bool = true)
    {
        childAnimatingView.isHidden = status
    }
    
    private func setup()
    {
        setupControls()
    }
    
    private func setupControls()
    {
        childController = ContainerViewController.newInstance(delegate: self, param: parameters)

         // Add child view controller
        childAnimatingView = addChildViewController(childController, frame: self.parentController?.frame) ?? UIView()
        
        childAnimatingViewHideStatus()
    }
    
    public func togglePanel()
    {
        if isWebViewLoaded
        {
            if !isPanelShowing
            {
                self.parentController?.bringSubviewToFront(childAnimatingView)
                
                delegate?.panelLaunching()
                
                childAnimatingViewHideStatus(false)
                
                self.parentController?.layer.add(CATransition().moveInFromRight(), forKey: nil)
            }
            else
            {
                delegate?.panelClosing(param3: parameters.param3, param4: parameters.param4, param5: parameters.param5)
                
                self.parentController?.layer.add(CATransition().moveOutToRight(), forKey: nil)
                
                childAnimatingViewHideStatus()
            }
            
            isPanelShowing = !isPanelShowing
        }
    }
}

extension PollfishSetupWindowView: ContainerViewProtocol
{
    func show()
    {
        if setupViewAtInitialization
        {
            togglePanel()
        }
        
        isWebViewLoaded = true
    }
    
    func close()
    {
        togglePanel()
    }
}

