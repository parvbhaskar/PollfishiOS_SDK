import UIKit
import PollfishiOS_SDK

class SceneDelegate: UIResponder, UIWindowSceneDelegate
{
    var window: UIWindow?
    var pollfishSetupWindowView: PollfishSetupWindowView?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        pollfishSetupWindowView = PollfishSetupWindowView.newInstance(parentViewController: window)
        pollfishSetupWindowView?.parameters = Param(param1: "Test param 1", param2: "Test param 2", param3: "Test param 3", param4: "Test param 4", param5: "Test param 5") // Set parameters that you need to show and get back
        pollfishSetupWindowView?.delegate = self
        pollfishSetupWindowView?.viewDidLoad()
        
        guard let _ = (scene as? UIWindowScene) else { return }
    }
}

extension SceneDelegate: PollfishSetupViewDelegate
{
    func panelLaunching()
    {
        print("Panel Launched")
    }
    
    func panelClosing(param3: String, param4: String, param5: String)
    {
        print("Panel closing with parameters- param3: \(param3), param4: \(param4), param5: \(param5)")
    }
}
