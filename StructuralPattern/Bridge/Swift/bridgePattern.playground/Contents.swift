protocol Engine {
    func start() -> String
}

class Manual: Engine{
    func start() -> String {
        return "Manual engine is ON"
    }
}

class Automatic : Engine{
    func start() -> String {
        return "Automatic engine is ON"
    }
}

class Car {
    fileprivate var engine: Engine
    
    init(_ engine: Engine) {
        self.engine = engine
    }

    func startEngine() -> String {
        return "Abstraction: " + engine.start()
    }
}

class BMW: Car{
    override func startEngine() -> String {
        return "BMW engine: " + engine.start()
    }
}

class AUDI: Car{
    override func startEngine() -> String {
        return "AUDI engine: " + engine.start()
    }
}

class Ford: Car{
    override func startEngine() -> String {
        return "Ford engine: " + engine.start()
    }
}

let manualEngine: Engine = Manual()
let automaticEngine: Engine = Automatic()

var car: Car = Ford(manualEngine)
car.startEngine()

car = BMW(automaticEngine)
car.startEngine()

//OUTPUT
//Ford engine: Manual engine is ON
//BMW engine: Automatic engine is ON
