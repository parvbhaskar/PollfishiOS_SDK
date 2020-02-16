import UIKit
import WebKit

extension WKWebView
{
    override open func awakeFromNib()
    {
        setup()
    }

    override open func prepareForInterfaceBuilder()
    {
        setup()
    }

    func setup()
    {
        translatesAutoresizingMaskIntoConstraints = false
    }

    func setup(with: (WKWebView) -> Void)
    {
        setup()
        with(self)
    }
}
