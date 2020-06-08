class main {
    let canvas = Canvas()
    var geometry: Geometry
    init(){
        geometry = Triangle()
        canvas.paint(geometry)
        
        geometry = Square()
        canvas.paint(geometry)
        
        geometry = Circle()
        canvas.paint(geometry)
    }
}

class Canvas {
    func paint(_ geometry: Geometry){
        print("\(geometry.build())")
    }
}

protocol Geometry{
    func build() -> String
}

class Triangle: Geometry{
    func build() -> String {
        return "I´m a triangle 🔺"
    }
}

class Square: Geometry{
    func build() -> String {
        return "I´m a square ◼️"
    }
}

class Circle: Geometry{
    func build() -> String {
        return "I´m a circle 🟠"
    }
}

main()

