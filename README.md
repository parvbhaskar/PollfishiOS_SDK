# Pollfish iOS SDK
## Usage
It is a very helpfull library used to present the animating vie on the existing view.

Install the library by drag and drop the compiled framework file from the PollfishiOS_SDK project. And make the framework to enable for "Embed & Sign" option in "Framework, Libraries, and Embedded content" option of General tab of targets. 


## GETTING STARTED: How to use the SDK
See the examples below:

1) Use sdk with controller initialization.
```bash
import PollfishiOS_SDK
        
// Initialize the view controller that you need to show
let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
let sampleViewController = 
storyBoard.instantiateViewController(withIdentifier: "sampleView") as! SampleViewController 

let pollfishViewController = PollfishSetupViewController.newInstance(parentViewController: sampleViewController)

self.navigationController?.pushViewController(pollfishViewController, animated: true)
```

2) Use sdk with initialization at SceneDelegate.
```python
import PollfishiOS_SDK

var window: UIWindow?
var pollfishSetupWindowView: PollfishSetupWindowView?

func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    pollfishSetupWindowView = PollfishSetupWindowView.newInstance(parentViewController: window)
    pollfishSetupWindowView?.viewDidLoad()
    
    guard let _ = (scene as? UIWindowScene) else { return }
}
```
Send parameters as:
```
pollfishObhect.parameters = Param(param1: "Test param 1", param2: "Test param 2", param3: "Test param 3", param4: "Test param 4", param5: "Test param 5") 
```

SDK Callbacks:

```
pollfishObhect.delegate = self  

func panelLaunching() {}

func panelClosing(param3: String, param4: String, param5: String){}
```

## PollfishiOS SDK overview
### 1) Use sdk with controller initialization.

when the new view is presented then the sdk load the url content and show the panel on the current screen once.


### 2) Use sdk with initialization at SceneDelegate.

It initialize the sdk and create panel on window, so that any view contrlller you are at you can see the panel, In this scenario you just need to initialize the sdk once at the sceneDelegate after that you can access it anywhere in the project.

**setupViewAtInitialization**: this property give you access to stop the first panel show when the webview successfully loads.

**togglePanel**: it gives the access to show and hidel panel when required.
