enum Mode {
    case easy
    case hard
}

class MapFactory{
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
    var easyMap = MapFactory().make(mode: .easy)
    var hardMap = MapFactory().make(mode: .hard)
    
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
