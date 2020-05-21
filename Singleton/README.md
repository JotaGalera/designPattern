# Singleton pattern

### What is?:

Singleton design pattern is used when you don´t want to let more of one instance of one class. This pattern is not recommended as you are something like a global instance. For this reason, it usual use another way in order to solve the problem. But if you are cautious this is an easy pattern to make.

### Example:

The key is declare a private init in order not to let create a new instance of the class. 

~~~~
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
//OUTPUT
Total: 105
~~~~