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
