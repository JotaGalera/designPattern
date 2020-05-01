# Builder pattern

### What is?:

Builder pattern is a creational pattern . If you need to build products with the same propeties this is your pattern. Due to this fact, our code to build objects will be abstracted from the main one. You can find two version for this pattern: with or without Director. 

### Example: 

A toy store have a product: "Star wars puzzle". In order to make this product when a client would like to buy it, we use the Builder pattern:

~~~~
protocol ToysBuilder {
    func buildName()
    func buildAge()
    func buildMaterial()
    func buildCategory()
    func getToy()->Toys
}

class StarWarsBuilder: ToysBuilder {
    private var toy: Toys
    
    init(){
        toy = Toys()
    }
    
    func buildName(){
        toy.setName(name: "Star wars")
    }
    
    func buildAge() {
        toy.setAge(age: 3)
    }
    
    func buildMaterial() {
        toy.setMaterial(material: "Paperboard")
    }
    
    func buildCategory() {
        toy.setCategory(category: "Puzzle")
    }
    
    func getToy()->Toys{
        return toy
    }
}

class Toys {
    private var name: String?
    private var age: Int?
    private var material: String?
    private var category: String?
    
    func setName(name: String){
        self.name = name
    }
    
    func setAge(age: Int){
        self.age = age
    }
    
    func setMaterial(material: String){
        self.material = material
    }
    
    func setCategory(category: String){
        self.category = category
    }
    
    func getToy()->String{
        return "Product name: \(name).\\n This product is recommended for \(age) years old.\\n His categoryThis product is made with \(material).\\n Category toy: \(category)"
    }
}

class ToyStore {
    private var toyBuilder: ToysBuilder
    private var toy: Toys = Toys()
    
    init(){
        toyBuilder = StarWarsBuilder()
    }
    
    func makePuzzle(){
        toyBuilder.buildName()
        toyBuilder.buildAge()
        toyBuilder.buildMaterial()
        toyBuilder.buildCategory()
        
        toy = toyBuilder.getToy()
    }
    
    func showToy(){
        print( toy.getToy() )
    }
    
}
let toyStore = ToyStore()
toyStore.makePuzzle()
toyStore.showToy()

//OUTPUT
Product name: Optional("Star wars").\n This product is recommended for Optional(3) years old.\n His categoryThis product is made with Optional("Paperboard").\n Category toy: Optional("Puzzle")

~~~~