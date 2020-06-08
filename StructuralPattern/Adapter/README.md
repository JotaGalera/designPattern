# Adapter pattern

### What is: 

Adapter pattern is used when you have an interfaz and a class which isn´t fully compatible with the interfaz. In this case, we can use an intermediate class (the adapter) and it will be like a communicator between the interfaz and the class.

### Example:

In our program we have a train driver and he should be able to drive any type train. In this case, we can make a "Train" interfaz and it has two methods: "Accelerate" and "Decelerate". "Steam Locomotive" and "Diesel Locomotive" agree the intefaz. But "Electric Locomotive" need more methods to achieve the interfaz requeriments. For example:

~~~~~

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

//OUPUT
Driver drives Steam Locomotive: 
Adding coal...
Stop adding coal...
Driver drives Diesel Locomotive: 
Pushing accelerate button...
Pushing stop button...
Driver drives Electric Locomotive: 
Starting the engine...
speeding up...
Breaking... 
Turning off the engine...

~~~~~
