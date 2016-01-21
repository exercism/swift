import Darwin

// Apple Swift version 2.1

func == (left: (result: UInt64, error: String?), right:(result: UInt64, error: String?) ) -> Bool
{
    if left.result == right.result && left.error == right.error
    {
        return true
    }
    else
    {
        return false
    }
}


struct Grains {
    static func square(num:Int)->(result: UInt64, error: String?){
        if num < 1 || num > 64 {
            return (result: 0, error: "Input[\(num)] invalid. Input should be between 1 and 64 (inclusive)")
        } else {
            let one:UInt64 = 1
            let shift = UInt64(num - 1)
            return  (result: one << shift, error:nil)
        }}
    
    static var total:UInt64 {
        return UINT64_MAX
    }
}
