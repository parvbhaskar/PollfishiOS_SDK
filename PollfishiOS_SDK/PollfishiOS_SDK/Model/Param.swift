import UIKit

open class Param
{
    open var param1: String
    open var param2: String
    open var param3: String
    open var param4: String
    open var param5: String
    
    public init(param1:String = "", param2:String = "", param3:String = "", param4:String = "", param5:String = "")
    {
        self.param1 = param1
        self.param2 = param2
        self.param3 = param3
        self.param4 = param4
        self.param5 = param5
    }
}
