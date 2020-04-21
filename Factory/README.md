# Factory

### What is?:

Factory pattern is a design pattern wich solves the problem of creating different objects with the same context.

### Example:

Usually, in a videogame, you can select between different difficulties. In this case, we only use two kind: Easy and Hard. The number of enemies and other obstacles are different according to the difficulty. If we make two map implementations and we do a mix between easy and hard mode in our Main. We get a big mountain of spaghetti code. For this reason, we use Factory pattern.

~~~~
protocol MapFactory {
    func make()->Map
}

class MapEasyFactoryImplementation: MapFactory{
    func make() -> Map {
        return MapEasy()
    }
}

class MapHardFactoryImplementation: MapFactory{
    func make() -> Map {
        return MapHard()
    }
}

protocol Map {
    func build()->String
}

class MapEasy: Map{
    func build()->String{
        return "new map easy mode"
    }
}

class MapHard: Map{
    func build()->String{
        return "new map hard mode"
    }
}

class main {
    var mapFactory: MapFactory
    var map: Map
    
    init(){
        mapFactory = MapEasyFactoryImplementation()
        map = mapFactory.make()
    }
    
    func chooseFactory(option: Int)->MapFactory{
        if option == 1 {
            return MapEasyFactoryImplementation()
        }
        return MapHardFactoryImplementation()
    }
    
    func showResult(){
        mapFactory = chooseFactory(option: 1)
        map = mapFactory.make()
        print ("Generating a \(map.build())")
        
        mapFactory = chooseFactory(option: 2)
        map = mapFactory.make()
        print ("Generating a \(map.build())")
    }
}

main().showResult()

//OUTPUT
Generating a new map easy mode
Generating a new map hard mode

~~~~
