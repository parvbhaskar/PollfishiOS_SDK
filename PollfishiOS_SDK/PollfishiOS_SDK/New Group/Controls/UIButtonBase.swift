import UIKit

class UIButtonBase: UIButton
{
    override func awakeFromNib()
    {
        setup()
    }

    override func prepareForInterfaceBuilder()
    {
        setup()
    }

    func setup()
    {
        setTitleColor(.black, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 25)
        translatesAutoresizingMaskIntoConstraints = false
    }

    func setup(with: (UIButtonBase) -> Void)
    {
        setup()
        with(self)
    }
}
