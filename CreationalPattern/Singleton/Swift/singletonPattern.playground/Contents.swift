class Accountant {
    static let instance = Accountant()
    private var count: Int
    
    private init(){
        count = 0
    }
    
    func getCount()->Int{
        return count
    }
    
    func addCount(int: Int){
        count += int
    }
}

class Program1 {
    var bill1 = 5
    var bill2 = 15
    var bill3 = 25
    
    func checkIn(){
        Accountant.instance.addCount(int: bill1)
        Accountant.instance.addCount(int: bill2)
        Accountant.instance.addCount(int: bill3)
    }
}

class Program2 {
    var bill1 = 10
    var bill2 = 15
    var bill3 = 35
    
    func checkIn(){
        Accountant.instance.addCount(int: bill1)
        Accountant.instance.addCount(int: bill2)
        Accountant.instance.addCount(int: bill3)
    }
}

var program1 = Program1()
var program2 = Program2()
program1.checkIn()
program2.checkIn()
print("Total: \(Accountant.instance.getCount())")
