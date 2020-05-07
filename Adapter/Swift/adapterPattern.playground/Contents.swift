protocol Locomotive {
    func accelerate()
    func decelerate()
}

class SteamLocomotive: Locomotive{
    func accelerate(){
        print("Adding coal...")
    }
    
    func decelerate(){
        print("Stop adding coal...")
    }
}

class DieselLocomotive: Locomotive{
    func accelerate() {
        print("Pushing accelerate button...")
    }
    func decelerate() {
        print("Pushing stop button...")
    }
}

class ElectricLocomotiveAdapter: Locomotive{
    var electricLocomotive: ElectricLocomotive = ElectricLocomotive()
    
    func accelerate() {
        electricLocomotive.startingTheEngine()
        electricLocomotive.pressAccelerator()
    }
    
    func decelerate() {
        electricLocomotive.pressDesacelerate()
        electricLocomotive.turnOffTheEngine()
    }
}

class ElectricLocomotive {
    
    func startingTheEngine(){
        print ("Starting the engine...")
    }
    
    func turnOffTheEngine(){
        print("Turning off the engine...")
    }
    
    func pressAccelerator(){
        print("speeding up...")
    }
    func pressDesacelerate(){
        print("Breaking... ")
    }
}

class TrainDriver {
    
    func drive(locomotive: Locomotive){
        locomotive.accelerate()
        locomotive.decelerate()
    }
}

let driver = TrainDriver()
print ("Driver drives Steam Locomotive: ")
driver.drive(locomotive: SteamLocomotive())
print ("Driver drives Diesel Locomotive: ")
driver.drive(locomotive: DieselLocomotive())
print ("Driver drives Electric Locomotive: ")
driver.drive(locomotive: ElectricLocomotiveAdapter())
