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
