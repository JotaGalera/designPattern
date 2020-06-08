# Abstract Factory pattern

This pattern is very usefull when we foresee a family object. For example: Enemies in a game. This is a simple way in order to keep a clean structure and avoid to have duplicate code in our project.

### Example: 

A game generate a number of enemies with different difficult according the mode chosen (easy, medium, hard, etc ). We´ll be able to make these enemies in an easy way using this pattern. "ModeEnemyFactory" will be the abstract entity that we´ll call when we want to create the enemies. 
~~~~
enum Mode{
    case easy
    case hard
}

protocol EnemyFactory{
    func makeMinion()->Minion
    func makeBoss()->Boss
}

protocol Minion{
    func getHP()->Int
    func getName()->String
}
protocol Boss{
    func getHP()->Int
    func getName()->String
}

class EasyEnemyFactory: EnemyFactory{
    func makeMinion()->Minion{
        return EasyMinion()
    }
    func makeBoss()->Boss{
        return EasyBoss()
    }
}

class HardEnemyFactory: EnemyFactory{
    func makeMinion()->Minion{
        return HardMinion()
    }
    func makeBoss()->Boss{
        return HardBoss()
    }
}

class EasyMinion: Minion{
    let hp = 15
    let name = "minion"
    
    func getHP()->Int{
        return hp
    }
    func getName()->String{
        return name
    }
}

class EasyBoss: Boss{
    let hp = 100
    let name = "boss"
    
    func getHP()->Int{
        return hp
    }
    func getName()->String{
        return name
    }
}

class HardMinion: Minion{
    let hp = 50
    let name = "super minion"
    
    func getHP()->Int{
        return hp
    }
    func getName()->String{
        return name
    }
}

class HardBoss: Boss{
    let hp = 450
    let name = "super boss"
    
    func getHP()->Int{
        return hp
    }
    func getName()->String{
        return name
    }
}

class Map {
    init(){}
    
    func configureMap(mode: String){
        let enemyFactory: EnemyFactory = mode == "Easy" ? EasyEnemyFactory() : HardEnemyFactory()
        let minion = enemyFactory.makeMinion()
        let boss = enemyFactory.makeBoss()
        
        print("This map has \(minion.getName()) with \(minion.getHP()) hp.")
        print("You can find the final \(boss.getName()) with \(minion.getHP()) hp")
    }
}

Map().configureMap(mode: "Hard")

//OUTPUT
//This map has super minion with 50 hp. You can find the final super boss with 450 hp
~~~~
