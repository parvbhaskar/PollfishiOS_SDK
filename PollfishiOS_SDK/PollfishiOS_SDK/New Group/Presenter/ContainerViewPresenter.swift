import Foundation

public protocol ContainerViewPresenterView
{
    func loadWebView(request: URLRequest)
}

public class ContainerViewPresenter
{
    private let view: ContainerViewPresenterView
    private var requestUrl = ""
    
    init(view: ContainerViewPresenterView)
    {
        self.view = view
    }
    
    func viewDidLoad(requestUrl: String)
    {
        self.requestUrl = requestUrl
        
        createWebRequest()
    }
    
    private func createWebRequest()
    {
        if let url = URL(string: requestUrl)
        {
            let request = URLRequest(url: url)
            
            view.loadWebView(request: request)
        }
    }
}
