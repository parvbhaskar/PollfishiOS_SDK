import UIKit

extension CATransition
{
    func moveOutToRight() -> CATransition
    {
        self.duration = 0.5
        self.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        self.type = CATransitionType.reveal
        self.subtype = CATransitionSubtype.fromLeft
        
        return self
    }

    func moveInFromRight() -> CATransition
    {
        self.duration = 0.7
        self.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        self.type = CATransitionType.moveIn
        self.subtype = CATransitionSubtype.fromRight
        
        return self
    }
}

