class ToysBuilder {
    private var toy = Toys()
    
    func setName(name: String) -> ToysBuilder{
        toy.setName(name: name)
        return self
    }
    
    func setAge(age: Int) -> ToysBuilder {
        toy.setAge(age: 3)
        return self
    }
    
    func setMaterial(material: String) -> ToysBuilder {
        toy.setMaterial(material: material)
        return self
    }
    
    func setCategory(category: String) -> ToysBuilder {
        toy.setCategory(category: category)
        return self
    }
    
    func build() -> Toys{
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

    func getFeatures()->String{
        return "Product name: \(name).\\n This product is recommended for \(age) years old.\\n His categoryThis product is made with \(material).\\n Category toy: \(category)"
    }
}

class ToyStore {
    private var toyBuilder: ToysBuilder
    private var toy: Toys = Toys()
    
    init(){
        toyBuilder = ToysBuilder()
    }
    
    func makePuzzle(){
        toy = toyBuilder.setName(name: "Star Wars Puzzle")
                        .setAge(age: 5)
                        .setMaterial(material: "Paperboard")
                        .setCategory(category: "Kids")
                        .build()
    }
    
    func showToy(){
        print( toy.getFeatures() )
    }
    
}
let toyStore = ToyStore()
toyStore.makePuzzle()
toyStore.showToy()
