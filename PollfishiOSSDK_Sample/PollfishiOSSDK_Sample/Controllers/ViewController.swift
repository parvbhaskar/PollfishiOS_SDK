import UIKit
import PollfishiOS_SDK

class ViewController: UIViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    @IBAction func buttonUsePollfishiOSSDK(_ sender: Any)
    {
        // Initialize the view controller that you need to present
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let sampleViewController = storyBoard.instantiateViewController(withIdentifier: "sampleVIew") as! SampleViewController
        
        // Setup the Pollfish sdk with the presenting view controller
        let pollfishViewController = PollfishSetupViewController.newInstance(parentViewController: sampleViewController)
        pollfishViewController.delegate = self  // Set the delegates to get the callbacks
        pollfishViewController.parameters = Param(param1: "Test param 1", param2: "Test param 2", param3: "Test param 3", param4: "Test param 4", param5: "Test param 5") // Set parameters that you need to show and get back
        
        self.navigationController?.pushViewController(pollfishViewController, animated: true)
    }
    
    @IBAction func buttonUsePollfishiOSSDKWindoe(_ sender: Any)
    {
        let currentScene = UIApplication.shared.connectedScenes.first
        guard let sceneDelegate = (currentScene?.delegate as? SceneDelegate) else { return }
        
        sceneDelegate.pollfishSetupWindowView?.togglePanel()        
    }

}

extension ViewController: PollfishSetupViewDelegate
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
