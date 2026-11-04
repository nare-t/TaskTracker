import Playgrounds

#Playground {
    
    var age: Int = 20
    var price: Double = 1000
    var isActive: Bool = false
    var message: String = "barev!"
    
    var colors: [String] = ["Red","Blue", "Orange"]
    colors.append("Yellow")
    
    var user: [String: String] = [
        "name": "Nare",
        "Role": "Dev"
    ]
    
    func greet() {
        print("barev!")
    }
    
    greet()
    
    func calculateTotal(price: Double, quantity: Int) -> Double {
        return price * Double(quantity)
    }
    
    print(calculateTotal(price: 20.98, quantity: 3))
}
