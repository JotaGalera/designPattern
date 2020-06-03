import UIKit

enum Place {
    case Spain
    case Greece
    case Italy
    case Portugal
}

class FacadeGPSRoute {
    private let coordinate: Coordinate
    private let path: Path
    
    init(){
        coordinate = Coordinate()
        path = Path()
    }
    
    func calculateRoute(exit: Place, goal: Place) -> String {
        let exitCoordinates = coordinate.getCoordinates(place: exit)
        let goalCoordinates = coordinate.getCoordinates(place: goal)
        
        let distance = path.calculatePath(initPoint: exitCoordinates, destinationPoint: goalCoordinates)
        let timeToArrive = path.estimateTimeInHour(distance: distance)
        
        return "His destine is: \(goal) Time to arrive: \(timeToArrive) h."
    }
}

class Coordinate {
    func getCoordinates(place: Place)->CGPoint{
        switch place {
        case .Spain:
            return CGPoint(x: -3.7492199, y: 40.4636688)
        case .Greece:
            return CGPoint(x: 21.8243122, y: 39.0742073)
        case .Italy:
            return CGPoint(x: 12.5674, y: 41.8719)
        case .Portugal:
            return CGPoint(x: -9.142685, y: 38.736946)
        }
    }
}

class Path {
    func calculatePath(initPoint: CGPoint, destinationPoint: CGPoint) -> Float{
        return Float(sqrt( pow((destinationPoint.x - initPoint.x), 2) + pow((destinationPoint.y - initPoint.y), 2) ))
    }
    
    func estimateTimeInHour(distance: Float) -> Float {
        return distance / 0.120
    }
}

class GPS {
    private let router = FacadeGPSRoute()
    
    func getRoute(exit: Place, goal: Place)->String{
        return router.calculateRoute(exit: exit, goal: goal)
    }
}

let gps = GPS()
let exit = Place.Spain
let goal = Place.Italy

print ("\(gps.getRoute(exit: exit, goal: goal))")
