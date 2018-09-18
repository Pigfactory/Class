import Foundation

//: [Previous](@previous)
/*:
 ---
 # Enumerations
 - 연관된 값의 그룹에 대해 공통 타입을 정의한 뒤 type-safe 하게 해당 값들을 사용 가능
 ---
 */

enum SomeEnumeration {
  // enumeration definition goes here
}


// Enumeration Type 이름은 Pascal Case
// 각 case 는 Camel Case

enum CompassPoint {
  case north
  case south
  case east
  case west
}

enum Planet {
  case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

var directionToHead1 = CompassPoint.west
directionToHead1 = .east
type(of: directionToHead1)
directionToHead1
//type annotation
var directionToHead2: CompassPoint = .north
type(of: directionToHead2)


/*:
 ## Matching Enumeration Values
 */
let directionToHead = CompassPoint.south

switch directionToHead {
case .north:
  print("Lots of planets have a north")
case .south:
  print("Watch out for penguins")
case .east:
  print("Where the sun rises")
case .west:
  print("Where the skies are blue")
}


let somePlanet = Planet.earth
let somePlanet1 = Planet.neptune


switch somePlanet {
case .earth:
  print("Mostly harmless")
default:
  print("Not a safe place for humans")
}

switch somePlanet1 {
case .earth:
    print("Mostly harmless")
default:
    print("Not a safe place for humans")
}

/*:
 ---
 ## Associated Values
 ---
 */
print("\n---------- [ Associated Values ] ----------\n")

enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
    //case something
}

//var barcorde = Barcode.something

var productBarcode = Barcode.upc(8, 85909, 51226, 3)
print(productBarcode)
productBarcode = .qrCode("ABCDEFGHIJKLMNOP")
type(of: productBarcode)

print(productBarcode)
//변수 productBarcode에 처음에는 upc값이 입력되었다가 다음에 qrCode값이 입력되었기 때문에
//print시 마지막에 입력된 qrCode만 출력됨



switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
  print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case .qrCode(let productCode):
  print("QR code: \(productCode).")
}

//아래와 같이 let을 밖에다가 선언하면 각각에 선언하지 않아도 됨
switch productBarcode {
case let .upc(numberSystem, manufacturer, product, check):
  print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case let .qrCode(productCode):
  print("QR code: \(productCode).")
}


/*:
 ---
 ### Question
 - enum Month { case jan, feb } 를 정의하되 2월이 윤년인지 아닌지 정보를 전달할 수 있도록 구현
 ---
 */

enum Month {
    case jan(String)
    case feb(a: Int)
}

func checkLeapYear(thisYear: Month) {
    switch thisYear {
    case let .feb(a) where (a % 400 == 0) || (a % 4 == 0) && (a % 100 != 0) :
    print ("\(a)년 2월은 윤년달")
    case let .feb(a) where !(a % 400 == 0) || (a % 4 == 0) && (a % 100 != 0) :
    print ("\(a)년 2월은 not 윤년달")
    default:
    print ("Error")
    }
}
checkLeapYear(thisYear: .feb(a: 6))


//enum 안에 func 넣어서 풀어보기
enum Month1 {
    case feb(a: Int)

    func leapYear() {
        switch self {
        case let .feb(a) where (a % 400 == 0) || (a % 4 == 0) && (a % 100 != 0) :
            print ("\(a)년 feb은 윤년달")
        case let .feb(a) where !(a % 400 == 0) || (a % 4 == 0) && (a % 100 != 0) :
            print ("\(a)년 feb은 not 윤년달")
        default:
            print ("Error")
        }
    }
}

let year = Month1.feb(a: 2000)
year.leapYear()

//case feb(a: Int) 대신 a 지우고 아래 switch case 에서 feb(Int)를 let .feb(a)로 받아서 사용
enum Month2 {
    case feb(Int)
    
    func leapYear() {
        switch self {
        case let .feb(a) where (a % 400 == 0) || (a % 4 == 0) && (a % 100 != 0) :
            print ("\(a)년 feb은 윤년달")
        case let .feb(a) where !(a % 400 == 0) || (a % 4 == 0) && (a % 100 != 0) :
            print ("\(a)년 feb은 not 윤년달")
        default:
            print ("Error")
        }
    }
}

let year2 = Month2.feb(2000)
year2.leapYear()
Month2.feb(2000).leapYear() //return값이 없어서 우측에는 아무 표시가 안됨????? 아닌거 같은데



/*:
 ---
 ## Raw Value
 - Strings, Characters, or any of the Integer or Floating-point number types
 - raw value 는 해당 Enumeration 내에서 반드시 고유한 값이어야 함.
 ---
 */

enum Grade {
    case A, B, C, D, F
}

Grade.A
//Grade.A.rawValue 작동 안됨, return값이 없기 때문에


enum Grade2: Double {
  case A = 4.0, B = 3.0, C = 2.0, D = 1.0, F = 0.0
}

Grade2.A
Grade2.A.rawValue


enum Weekday: Int {
  case sunday, monday, tuesday, wednesday, thursday, friday, saturday
}

Weekday.wednesday
Weekday.wednesday.rawValue


enum WeekdayName: String {
  case sunday, monday, tuesday = "jjjj", wednesday, thursday, friday, saturday
}

WeekdayName.monday
WeekdayName.monday.rawValue
WeekdayName.tuesday.rawValue


/*:
 ---
 ### Implicitly Assigned Raw Values
 ---
 */

enum WeekdayAgain: Int {
  case sunday, monday = 100, tuesday = 101, wednesday, thursday, friday, saturday
//  case sunday = 0, monday = 1, tuesday = 2, wednesday, thursday, friday, saturday
}
// 중간에 번호를 지정해주면 그 다음 case는 자동으로 +1이 더해진 rawvalue값을 가지게 됨
WeekdayAgain.sunday
WeekdayAgain.sunday.rawValue

WeekdayAgain.wednesday
WeekdayAgain.wednesday.rawValue

WeekdayAgain.friday.rawValue



enum WeekdayNameAgain: String {
  case sunday, monday = "mon", tuesday = "tue", wednesday, thursday, friday, saturday
}

//String은 rawvalue도 숫자로 안나옴
WeekdayNameAgain.sunday
WeekdayNameAgain.sunday.rawValue

WeekdayNameAgain.wednesday
WeekdayNameAgain.wednesday.rawValue


/*:
 ---
 ### Initializing from a Raw Value
 ---
 */
print("\n---------- [ Initializing from a Raw Value ] ----------\n")

enum PlanetIntRaw: Int {
  case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

PlanetIntRaw.init(rawValue:3)
//위에것을 줄인표현방식 아래
PlanetIntRaw(rawValue: 5)
PlanetIntRaw(rawValue: 7)

//rawValue를 사용하는 것은 optional로 취급됨, 아래 0이나 15는 없는 값으로 nil이 뜰수 있기 때문에
PlanetIntRaw(rawValue: 0)
PlanetIntRaw(rawValue: 15)


let positionToFind = 7
//let positionToFind = 11

if let somePlanet = PlanetIntRaw(rawValue: positionToFind) {
  switch somePlanet {
  case .earth:
    print("Mostly harmless")
  default:
    print("Not a safe place for humans")
  }
} else {
  print("There isn't a planet at position \(positionToFind)")
}


/*:
 ---
 ## Nested
 ---
 */
print("\n---------- [ Nested ] ----------\n")

// Function

enum Device: String {
  case iPhone, iPad, tv, watch
  
  func printType() {
    //여기 self는 Device를 받음
    //따라서 아래 예시의 경우에는Device.iPhone이 입력되는거
    switch self {
    case .iPad, .iPhone, .tv:
      print("device :", self)
    case .watch:
      print("apple Watch")
    }
  }
}

    //여기 self는 Device.iPhone이 입력되는거(위 설명)
let iphone = Device.iPhone
iphone.printType()

Device.tv.printType() //Q>이거는 왜 결과값이 없나?  A> return값을 지정해주지 않았기 때문에 없는듯 -> 이것도 아닌거 같은데

let TV = Device.tv
TV.printType()




// Enumerations

enum Wearable {
    case helmet(weight: Weight, armor: Armor)
    case boots
    
    
    enum Weight: Int {
        case light = 1
        case heavy = 2
    }
    enum Armor: Int {
        case light = 2
        case heavy = 4
    }
  
  
  func info() -> (weight: Int, armor: Int) {
    switch self {
    case let .helmet(weight, armor):        //.helmet(let weight, let armor)  ->original
      return (weight: weight.rawValue * 2, armor: armor.rawValue * 5)
    case .boots:
      return (3, 3)
    }
  }
}

print(Wearable.helmet(weight: .heavy, armor: .heavy).info())

var woodenHelmet = Wearable.helmet(weight: .light, armor: .heavy)
print(woodenHelmet.info())
print(woodenHelmet)

let boots = Wearable.boots
print(boots)
print(boots.info())



/*:
 ---
 ## Mutating
 - enum 타입 내부 함수에서 자기 자신의 값을 변경해야 할 경우 mutating 키워드 필요
 ---
 */

enum Location {
  case seoul, tokyo, london, newyork
  
  mutating func travelToTokyo() {
    self = .tokyo
    }
//  func travelToLondon() {
//    self = .london
//  }
}

//let location = Location.seoul
var location = Location.seoul
location

//location = Location.tokyo 대신에 내부함수로 수정되도록 해둠
location.travelToTokyo()
location




/*:
 ---
 ### Question
 - on 과 off 값을 가진 enum 타입 RemoteControl 에 호출 시마다 on, off 값을 바꿔줄 수 있는 함수 구현
 ---
 */

enum RemoteControl {
    case on
    case off
    
    mutating func toggle() {
        switch self{
        case .on:
            self = .off
        case .off:
            self = .on
        }
    }
} //Q>self 대신에 RemoteControl을 넣어주면 안되나?

var remoteControl = RemoteControl.on

remoteControl.toggle() //off
remoteControl.toggle() //on

/*:
 ---
 ## Recursive Enumerations
 - 자기 자신을 참조하는 Enumeration 형식
 ---
 */
print("\n---------- [ Recursive Enumerations ] ----------\n")

//enum ArithmeticExpression {
//  case number(Int)
//  case addition(ArithmeticExpression, ArithmeticExpression)
//  case multiplication(ArithmeticExpression, ArithmeticExpression)
//}

//이렇게도 가능
//enum ArithmeticExpression {
//  case number(Int)
//  indirect case addition(ArithmeticExpression, ArithmeticExpression)
//  indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
//}

indirect enum ArithmeticExpression {
  case number(Int)
  case addition(ArithmeticExpression, ArithmeticExpression)
  case multiplication(ArithmeticExpression, ArithmeticExpression)
}

//let five = ArithmeticExpression.number(5)
//let four = ArithmeticExpression.number(4)
//let sum = ArithmeticExpression.addition(five, four)
//let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))


/*:
 ---
 ### Question
 - 각 케이스별로 연산을 수행하고 그 값을 반환하는 evalue 함수 구현
 ---
 */
indirect enum Arithmetics {
    case number(Int)
    case addition(Arithmetics, Arithmetics)
    case multiplication(Arithmetics, Arithmetics)
}

let six = Arithmetics.number(6)
let ten = Arithmetics.number(10)
let sum = Arithmetics.addition(six, ten)
let product = Arithmetics.multiplication(sum, Arithmetics.number(2))


func evaluate(_ expression: Arithmetics) -> Int {
    switch expression {
    case let .number(value) :
        return value
    case let .addition(value1, value2) :
        return evaluate(value1) + evaluate(value2)  //Q>이부분 이해가 어렵네
    case let .multiplication(value1, value2) :
        return evaluate(value1) * evaluate(value2)
    }
}
evaluate(sum)
evaluate(product)

/***************************************************
 celcius, fahrenheit, kelvin 온도 3가지 케이스를 가진 Temperature enum 타입을 정의
 각 케이스에는 Double 타입의 Associated Value 를 받도록 함
 각 온도를 섭씨 온도로 변환해주는 toCelcius() 함수를 구현
 섭씨 = (화씨 - 32) * 5 / 9
 섭씨 = 켈빈 + 273
 ***************************************************/

enum Temperature {
    case celcius(Double)
    case fahrenheit(Double)
    case kelvin(Double)
    
    func toCelcius() -> Double {
        switch self {
        case let .celcius(degree) :
            return degree
        case let .fahrenheit(degree):
            return (degree-32) * 5 / 9
        case let .kelvin(degree):
            return degree + 273
        }
    }
}

let cel = Temperature.celcius(36.5)
let fahr = Temperature.fahrenheit(36.5)
let kel = Temperature.kelvin(36.5)
cel.toCelcius()
fahr.toCelcius()
kel.toCelcius()
print(Temperature.kelvin(40.7).toCelcius())
print(cel.toCelcius())




//1.
//자연수를 입력받아 원래 숫자를 반대 순서로 뒤집은 숫자를 반환하는 함수
//ex) 123 -> 321 , 10293 -> 39201
//


func revers(num: Int) {
    
    let stringNum = String(num)
    let reverseNum = stringNum.reversed()
    let stringNum2 = String(reverseNum)
    
    print(Int(stringNum2)!)
    
}
revers(num: 512)


//2.
//2개의 자연수와 사칙연산(+, -, *, /) 값을 가진 하나의 enum 타입을 입력받아 해당 연산을 수행하는 함수

//enum Arithmetic2 {
//    case addition
//    case subtraction
//    case multiplication
//    case division
//
//    func calcu2(num1: Int, num2: Int, arti: Arithmetic2) -> Int{
//        switch self {
//        case .addition:
//            print(num1 + num2)
//            return(num1 + num2)
//        case .subtraction:
//            print(num1 - num2)
//            return(num1 + num2)
//        case .multiplication:
//            print(num1 * num2)
//            return(num1 + num2)
//        case .division:
//            print(num1 / num2)
//            return(num1 + num2)
//        }
//    }
//}
//let a = Arithmetic2.calcu2(.addition)


enum Arithmetic {
    case addition
    case subtraction
    case multiplication
    case division
}

func calcu(num1: Int, num2: Int, arti: Arithmetic) -> Int {
    switch arti {
    case .addition:
        print(num1 + num2)
        return(num1 + num2)
    case .subtraction:
        print(num1 - num2)
        return(num1 + num2)
    case .multiplication:
        print(num1 * num2)
        return(num1 + num2)
    case .division:
        print(num1 / num2)
        return(num1 + num2)
    }
}

calcu(num1: 3, num2: 5, arti: .addition)



//3.
//정수 타입의 배열을 선언하고 해당 배열 요소 중 가장 큰 값을 반환하는 함수 만들기
//ex) [50, 23, 29, 1, 45, 39, 59, 19, 15] -> 59



func biggestNumber(nums: Int...) {
    var numbers: [Int] = []
    for i in nums {
        numbers.append(i)
    }
    let sortedNumbers = numbers.sorted(by: >= )
//    let reveredNumbers = sortedNumbers.reversed()  Q>이거는 왜 안되나
    print(sortedNumbers[0])
}

biggestNumber(nums: 33, 55, 1, 5)


//4.
//정수 타입의 배열을 2개 선언하고 겹치는 숫자들로 만들어진 배열을 반환하는 함수
//ex) [1, 2, 4, 8, 9, 12, 13] , [2, 5, 6, 9, 13]  -->  [2, 9, 13]

let groupA: [Int] = [1, 2, 3, 10, 99, 77]
let groupB: [Int] = [2, 3, 4, 77]

func compareGroup(a: [Int], b: [Int]) {
    var newGroup: [Int] = []
    for i in groupA {
        for j in groupB {
            if i == j {
                newGroup.append(i)
            }
        }
    }
    print(newGroup)
}
compareGroup(a: groupA, b: groupB)







//: [Next](@next)
