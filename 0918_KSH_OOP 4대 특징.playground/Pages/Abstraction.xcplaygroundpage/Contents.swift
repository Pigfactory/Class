//protocol은 디자인할때 쓰는 방법, 따라서 아래 함수에 { code } 를 넣어주면 에러 발생

protocol Human {
  var name: String { get set }
  var age: Int { get }
  var gender: String { get }
  var height: Double { get }
  
  func sleep()
  func eat()
  func walk()
}

class User: Human {
    var name: String = "name"
    
    var age: Int = 10
    
    var gender: String = "male"
    
    var height: Double = 200.0
    
    func sleep() {
        print ("Sleep")
    }
    
    func eat() {
        print ("Eat")
    }
    
    func walk() {
        print("Walk")
    }
    
}

//프로코콜은 항상 var 만 사용??
protocol Simeple {
    var name: String { get }
    
}
class User2: Simeple{
    var name: String = "Name"
}



protocol RestuarantOwner {
    var name: String { get }
    var skill: String { get }
    var budget: Int { get }
    
    func hire()
    func cook()
    func cleaing()
}

class Owner: RestuarantOwner {
    var name: String = "franky"
    
    var skill: String = "curry"
    
    var budget: Int = 1000
    
    func hire() {
        print ("i need to hire someone")
    }
    
    func cook() {
        print ("i can cook whatever you want")
    }
    
    func cleaing() {
        print ("its cleaning time!")
    }
}








//: [Next](@next)
