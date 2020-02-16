import UIKit

public protocol PollfishSetupViewDelegate: class
{
    func panelLaunching()
    func panelClosing(param3: String, param4: String, param5: String)
}

open class PollfishSetupViewController: UIBaseViewController
{
    static public func newInstance(parentViewController: UIViewController) -> PollfishSetupViewController
    {
        let ret = PollfishSetupViewController()
        
        ret.parentController = parentViewController
        
        return ret
    }
    
    private var parentController:UIViewController! = nil
    private var parentView = UIView()
    private var childController:UIViewController! = nil
    private var childAnimatingView = UIView()
    
    open var parameters = Param()
    open weak var delegate: PollfishSetupViewDelegate?
    
    override public func viewDidLoad()
    {
        super.viewDidLoad()
        
        setup()
    }
    
    private func addChildViewController(_ child: UIViewController, frame: CGRect? = nil) -> UIView?
    {
        addChild(child)
        
        if let frame = frame
        {
            child.view.frame = frame
        }
        
        view.addSubview(child.view)
        
        child.didMove(toParent: self)
        
        return child.view
    }

    private func childAnimatingViewHideStatus(_ status:Bool = true)
    {
        childAnimatingView.isHidden = status
    }
    
    private func setup()
    {
        setupControls()
        setupConstraints()
    }
    
    private func setupControls()
    {
        childController = ContainerViewController.newInstance(delegate: self, param: parameters)

        // Add parent view controller
        parentView = addChildViewController(parentController, frame: self.view.frame) ?? UIView()
        
        // Add child view controller
        childAnimatingView = addChildViewController(childController, frame: self.view.frame) ?? UIView()
        
        childAnimatingViewHideStatus()
    }
    
    private func setupConstraints()
    {
        _ = parentView.safeAnchorConstraints(with: self.view)
    }
}

extension PollfishSetupViewController: ContainerViewProtocol
{
    func show()
    {
        delegate?.panelLaunching()
        
        childAnimatingViewHideStatus(false)
        
        self.view.layer.add(CATransition().moveInFromRight(), forKey: nil)
    }
    
    func close()
    {
        delegate?.panelClosing(param3: parameters.param3, param4: parameters.param4, param5: parameters.param5)
        
        self.view.layer.add(CATransition().moveOutToRight(), forKey: nil)
        
        childAnimatingViewHideStatus()
    }
}

