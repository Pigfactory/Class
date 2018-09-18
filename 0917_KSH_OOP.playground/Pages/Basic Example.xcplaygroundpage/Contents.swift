//: [Previous](@previous)
/*:
 # Class
 ![Class](class.png)
 */

// struct, enum   => Stack
// class  => Heap


class Dog {
  var color = "White"
  var eyeColor = "Black"
  var height = 30.0
  var weight = 6.0
  
  func sit() {
    print("sit")
  }
  func layDown() {
    print("layDown")
  }
  func shake() {
    print("shake")
  }
}



let bobby: Dog = Dog()
bobby.color = "Gray"
bobby.sit()

let tori = Dog()
tori.color = "Brown"
tori.layDown()


class Hero {
    var str = 0
    var dex = 0
    var int = 0
    var luc = 0
    
    func attack() {
        print("attack enemy, damage: \(str)")
    }
    func defend() {
        print("defend enemy's attack")
    }
    func move() {
        print("hero move forward")
    }
}

let warrior = Hero()
warrior.str = 9
warrior.dex = 8
warrior.int = 1
warrior.luc = 1
warrior.attack()
warrior.move()

//: ## Equatable, Identical

class User {
  let name = "이순신"
  let age = 30
}

let user1 = User()
let user2 = User()

type(of: user1)
//user1 == "이순신"   //error, 비교가 안됨
user1.name == "이순신"

//user1 == user2    // 어떤걸 비교해야할지 몰라서 에러 발생
user1.age == user2.age

user1 === user2   //참조대상(메모리주소)이 같는지 확인하는 연산자, 메모리 주소가 다르기 때문에 false



class User1: Equatable {    //동등비교 프로토콜 = equatable
  var name = "이순신"
  let age = 30

    //name만 같아도 true가 나오라는 함수
  static func ==(lhs: User1, rhs: User1) -> Bool {
    return lhs.name == rhs.name
  }
}

let user3 = User1()
var user4 = User1()
user4.name = "홍길동"
user3.name

user3 == user4    //equatable를 호출해줌, equatable로 정의해줬기때문에 비교 가능
user3 === user4   //
user3 !== user4   //


user4 = user3       //user3가 가르키는 주소값을 user4에 대입
user3 == user4    //equatable때문에 가능한것 lhs.name == rhs.name -> true
user3 === user4   //

user4.name = "세종대왕"
user3.name
user3.name = "장발장"
user4.name

/***************************************************
 Class Identity Operators
 
 === : Returns true when two constants or variables pointing to a same instance
 ***************************************************/



//: [Next](@next)
