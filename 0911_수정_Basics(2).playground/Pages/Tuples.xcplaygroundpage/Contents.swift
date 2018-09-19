//: [Previous](@previous)
/*:
 ---
 # Tuples
 ---
 */
/*:
 ---
 ## Unnamed Tuple
 ---
 */
let number: Int = 10

let threeNumbers: (Int, Int, Int) = (1, 2, 5)
type(of: threeNumbers)

threeNumbers

threeNumbers.0
threeNumbers.1
threeNumbers.2


var threeValues: (Int, Double, String) = (10,  100.0,  "이름")
type(of: threeValues)

threeValues

threeValues.0 = 5
threeValues


/*:
 ## Decomposition
 */

let numbers = threeNumbers
numbers
numbers.0
numbers.1
type(of: numbers)


let numbers2 = threeValues
numbers2
numbers2.0
numbers2.1
type(of: numbers2)


let (first, second, third) = threeNumbers
first
second


// wildcard pattern

let (_, second1, third1) = threeNumbers
second1
third1


/*:
 ---
 ## Named Tuple
 ---
 */

let iOS = (language: "Swift", version: "4")

//let iOS: (language: String, version: String) = (language: "Swift", version: "4")
//let iOS: (language: String, version: String) = ("Swift", "4")
//let iOS = (language: "Swift", version: "4")

iOS.0
iOS.1

iOS.language
iOS.version


func 튜플(a: Int, b: (Int, Int)) -> (first: Int, second: Int) {
  return (a + b.0, a + b.1)
}

let result = 튜플(a: 10, b: (20, 30))
result.first
result.second

/*:
 ## Comparison Operators
 * Tuple 은 7개 미만 요소에 대한 비교 연산자가 포함되어 있음
 * 7개 이상의 요소를 비교하기 위해서는 비교 연산자를 직접 구현해야 함
 */
//var something1: (Int, Int, Int, Int, Int, Int) = (1,2,3,4,5,6)
//var something2: (Int, Int, Int, Int, Int, Int) = (1,2,3,4,5,6)
//something1 == something2

//비교 할때는 0번째부터 우선비교, 동일하면 1번째로 넘어감...
(1, "zebra") < (2, "apple")   // true or false ?
(3, "apple") < (3, "bird")    // true or false ?
(4, "dog") == (4, "dog")      // true or false ?


/***************************************************
 Q. 다음 튜플 연산에 대한 결과는?
 
 - ("1", 1) < ("3.14", 99)   True
 
 - ("일", 1) > ("이", 2.0)    True
 
 - (1, "zebra") < ("2", "apple")    type이 다르기 때문에 비교 불가
 
 - ("blue", -1) < ("purple", 1)     True

 - ("blue", false) < ("purple", true)   bool type은 비교 불가
 ***************************************************/



/*:
 ---
 ## Tuple Matching
 ---
 */

let somePoint = (1, 1)

switch somePoint {
case (0, 0):
  print("\(somePoint) is at the origin")
case (_, 0):    //언더바(_)는 신경쓰지 않겠다는 의미
  print("\(somePoint) is on the x-axis")
case (0, _):
  print("\(somePoint) is on the y-axis")
case (-2...2, -2...2):
  print("\(somePoint) is inside the box")
default:
  print("\(somePoint) is outside of the box")
}



/*:
 ## Dictionary Enumeration
 */

let fruits = ["A": "Apple", "B": "Banana", "C": "Cherry"]

for (key, value) in fruits {
  print(key, value)  //dictionary 프린팅 순서는 랜덤(컴퓨터의 임의 룰로)
}

for element in fruits {
  print(element.key)
    //print(element.value)
    //print(element.0)
    //print(element.1)
    // 어떤 식으로 출력해야 할까요?
}



//: [Next](@next)
