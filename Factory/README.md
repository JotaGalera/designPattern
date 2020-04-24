# Factory

### What is?:

Factory pattern is a design pattern wich solves the problem of creating different objects with the same context.

### Example:

Usually, in a videogame, you can select between different difficulties. In this case, we only use two kind: Easy and Hard. The number of enemies and goals are generally different according to the difficulty. If we make two map implementations and we do a mix between easy and hard mode in our Main. We get a big mountain of spaghetti code. For this reason, we use Factory pattern.

~~~~
enum Mode {
    case easy
    case hard
}

class MapFactoryImplementation{
    func make(mode: Mode) -> Map {
        return MainMap(enemies: Enemy(mode: mode), goal: Goal(mode: mode))
    }
}

protocol Map{
    func getEnemy()->String
    func getGoal()->String
}

class MainMap: Map {
    var enemy: Enemy
    var goal: Goal
    
    init(enemies: Enemy,goal: Goal){
        enemy = enemies
        self.goal = goal
    }
    
    func getEnemy()->String{
        return enemy.getName()
    }
    
    func getGoal()->String{
        return goal.getName()
    }
}

class Enemy{
    let name: String
    
    init(mode: Mode){
        name = mode == Mode.easy ? "Easy Enemies" : "Hard Enemies"
    }
    
    func getName()->String{
        return name
    }
}

class Goal{
    let name: String
    
    init(mode: Mode){
        name = mode == Mode.easy ? "Easy goal" : "Hard goal"
    }
    
    func getName()->String{
        return name
    }
}
class main {
    var easyMap = MapFactoryImplementation().make(mode: .easy)
    var hardMap = MapFactoryImplementation().make(mode: .hard)
    
    func showEasyMap()->String{
        return "Easy mode has \(easyMap.getEnemy()) and \(easyMap.getGoal())"
    }
    
    func showHardMap()->String{
        return "Hard mode has \(hardMap.getEnemy()) and \(hardMap.getGoal())"
    }
}

main().showEasyMap()
main().showHardMap()

//OUTPUT
//Easy mode has Easy Enemies and Easy goal
//Hard mode has Hard Enemies and Hard goal

~~~~
