//Foundation not needed

struct PrimeFactors{
    
    static func For(var number:Int64)->[Int64]{
        
        var primes = [Int64]()
        var divisor:Int64 = 2
        
        while (number > 1){
            while (number % divisor == 0){
                primes.append(divisor)
                number /= divisor
            }
            divisor++
        }
        return primes
    }
}




