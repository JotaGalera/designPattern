# Strategy 

### What is?

Strategy design is a design pattern that is used in order to join application logic. 
In this design we use an interfaz in order to separate classes that they have a common logic.

### Example:

Paint different geometry shapes in a canvas like Triangles, Squares and Circles. In the solution, we give to Canvas an abstract instance, our protocol. In this way, we can add new geometries but our canvas doesn´t know it.

~~~~~
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
~~~~~
