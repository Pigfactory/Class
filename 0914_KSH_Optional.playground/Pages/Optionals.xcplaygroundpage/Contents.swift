//: [Previous](@previous)
/*:
 # Optionals
 */
/*:
 ---
 ### Question
 - 값이 0인 것과 없는 것의 차이는?  (Empty vs Valueless)
 ---
 */

let value1 = 0
let value2: Int? = nil
/*:
 ![optional](0vsNULL.jpg)
 */

/*:
 ---
 ## Optional
 * Optional 은 값이 없을 수 있는(absent) 상황에 사용
 * Objective-C 에는 없는 개념
 * 옵셔널 타입은 2가지 가능성을 지님
   - 값을 전혀 가지고 있지 않음
   - 값이 있으며, 그 값에 접근하기 위해 옵셔널을 벗겨(unwrap)낼 수 있음
 ---
 */


let possibleNumber = "123"
var convertedNumber = Int(possibleNumber)
type(of: convertedNumber)

type(of: Int("123"))
type(of: Int(3.14))
type(of: Int(3))




/*:
 ## Optional Type
 
 ![OptionalType](optional-type.png)
 */

// Type Declaration

var varType: String
varType = "123"
print(varType)

var optionalType1: String?
var optionalType2: Optional<Int>

type(of: optionalType1)
type(of: optionalType2)
optionalType1
optionalType2


// Valueless state - nil

var optionalInt: Int? = 0
optionalInt
optionalInt = nil
optionalInt



// Init 초기값 주는방법
var optionalIntInit = Optional<Int>(0)
type(of: optionalIntInit)
optionalIntInit

let some = Optional<String>.none
let some1: String? = nil
let some2 = Optional<String>.some("ABC")
let some3: String? = "ABC"

//nil을 벗길때 사용
switch optionalInt {
case .none:   //nil 자체가 enum 타입으로 되어있고 case가 none과 some으로 나눠진다
    print("nil")    //상단에 optionalInt를 nil로 정의했기 때문에 none 으로 빠짐
case .some(let value):
    print(value)
}


// Optional <-> NonOptional

//optional type이 아닌곳에는 nil을 넣을수 없다
//var nonOptional1 = nil
//var nonOptional2: Int = nil
//var nonOptionalType: Int = optionalInt

//optional 타입에는 nonOptional 타입을 넣을 수 있음
var integer = 1
optionalInt = integer
print(optionalInt)


// Optional -> NonOptional (X)
// Optional <- NonOptional (O)

/***************************************************
 Question
 - Optional 헤더 살펴보기
 - 아래 내용을 읽고 Objective-C 의 nil 과 Swift 의 nil 이 어떻게 다른지 말해보기
 
 Swift’s nil isn’t the same as nil in Objective-C.
 In Objective-C, nil is a pointer to a nonexistent object.
 In Swift, nil isn’t a pointer—it’s the absence of a value of a certain type.
 Optionals of any type can be set to nil, not just object types.
 ***************************************************/



/*:
 ---
 ## If Statements and Forced Unwrapping
 ---
 */
print("\n---------- [ if & forced unwrapping ] ----------\n")
//상단에 정의되어 있는것 가지고 내려옴
//var convertedNumber = Int("123")

if convertedNumber != nil {
  print("convertedNumber contains some integer value.")
//  print("convertedNumber has an integer value of \(convertedNumber).")
}


// ! = Forced Unwrapping
if convertedNumber != nil {
  print("convertedNumber has an integer value of \(convertedNumber!).")
}


print(convertedNumber)
print(convertedNumber!)


convertedNumber = nil
convertedNumber
//convertedNumber!  //확실할때만 !로 제거 아니면 안전하게 제거



/*:
 ---
 ## Optional Binding

 ![if](optional-binding-if.png)
 
 ![while](optional-binding-while.png)
 
 ![guard](optional-binding-guard.png)
 ---
 */
print("\n---------- [ Optinal binding 1] ----------\n")

let actualNumber1 = Int(possibleNumber)
type(of: actualNumber1)

if let actualNumber = Int(possibleNumber) {
  print("\"\(possibleNumber)\" has an integer value of \(actualNumber)")
} else {
  print("\"\(possibleNumber)\" could not be converted to an integer")
}



var optionalStr: String? = "Hello, Optional"

// let
//Q>앞의 optionalStr이랑 뒤의 optionalStr 의 차이점은? 왜 색깔이 다른가? --------------------------------------------
if let optionalStr = optionalStr {
  optionalStr
} else {
  "valueless string"
}

// var

if var str = optionalStr {
  str += "😍"
  str
}



// Out of scope

func doSomething(str: String?) {
  print(str)    //optional("something"
  type(of: str)     //optional<strig>
  
  guard let str = str else {
//    print(str)
//    type(of: str)
    //Q> 여기는 또 왜 에러???? ------------------------------------------------------------------------
    return
  } //값이 없으면 else 로 빠진다

  print(str)
//  type(of: str)
}

doSomething(str: "something")


print("\n---------- [ Optinal binding 2] ----------\n")
// Many optional bindings and Boolean conditions in a single if statement

if let firstNumber = Int("4"),
    let secondNumber = Int("42"),
    firstNumber < secondNumber && secondNumber < 100 {
  print("\(firstNumber) < \(secondNumber) < 100")
}

// ==

if let firstNumber = Int("4") {
  if let secondNumber = Int("42") {
    if firstNumber < secondNumber && secondNumber < 100 {
      print("\(firstNumber) < \(secondNumber) < 100")
    }
  }
}


/*:
 ## IUO (Implicitly Unwrapped Optionals)
 */
print("\n---------- [ IUO ] ----------\n")

let possibleString: String? = "An optional string."
let forcedString: String = possibleString!
type(of: possibleString)
type(of: forcedString)

//어느경우에도 값이 있을경우 ! 쓴다.
let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString
type(of: assumedString)
type(of: implicitString)


if assumedString != nil {
  print(assumedString!)
}

if let definiteString = assumedString {
  print(definiteString)
}


/***************************************************
 - 추후 어느 순간에서라도 nil 이 될 수 있는 경우에는 이 것을 사용하지 말아야 함
 - nil value 를 체크해야 할 일이 생길 경우는 일반적인 옵셔널 타입 사용
 ***************************************************/


/*:
 ## Nil-coalescing Operator
 */

print("\n---------- [ Nil-coalescing ] ----------\n")

//위에서 optionalStr 정의
//var optionalStr: String? = "Hello, Optional"

optionalStr = nil

let result: String
if optionalStr != nil {
   result = optionalStr!
} else {
   result = "???"
}
// 같은 표현
//let result = optionalStr ?? "???"

print(optionalStr ?? "AB")  //optional이면 "AB" 출력이라는 뜻
print(result)

//옵셔널 바인딩?: optionalType뒤에 물음표 두개
let result1 = optionalStr ?? ""
let result2 = optionalStr != nil ? optionalStr! : "??"
//!= nil 닐인지 아닌지 판단하고 false면 "??" true면 optionalStr! 가 입력
//이걸 더 줄인게 바로 윗줄 line 280



//삼항연산자 booltype 뒤에 물음표 하나
let boolType = true
boolType ? "A": "B"


//print(optionalStr)
print(result1)

// true ? a : b



// Example

let defaultColorName = "red"
var userDefinedColorName: String?

//유저가 이름을 정의했으면 userDefinedColorName을 호출, 아니면 defaultColorName을 호출
var colorNameToUse = userDefinedColorName ?? defaultColorName
print(colorNameToUse)

userDefinedColorName = "green"
colorNameToUse = userDefinedColorName ?? defaultColorName
print(colorNameToUse)



/***************************************************
 The nil-coalescing operator is shorthand for the code below:
 a != nil ? a! : b
 = a ?? b
 ***************************************************/

/*:
 ## Optional Chaining
 */

print("\n---------- [ Optional Chaining ] ----------\n")

let greeting: [String: String] = [
  "John": "Wassup",
  "Jane": "Morning",
  "Edward": "Yo",
  "Tom": "Howdy",
  "James": "Sup"
]

//앞에것이 optional이면 뒤에 따라오는 명령어도 다 optional로 됨 -> chaining
greeting["John"]
type(of: greeting["John"])
print(greeting["John"])
print(greeting["John"]?.count.distance(to: 8))
print(greeting["Alice"]?.count.distance(to: 4))
print(greeting["John"]!.count.distance(to: 8))



if let greetingValue = greeting["John"] {
  print(greetingValue.count.distance(to: 8))
} else {
  // Do nothing
}




/*:
 ---
 ### Question
 - 아래 두 종류 옵셔널의 차이점이 무엇일까요?
 ---
 */
print("\n---------- [ two type of optional ] ----------\n")


var optionalArr1: [Int]? = [1,2,3]
var optionalArr2: [Int?] = [1,2,3]



var arr1: [Int]? = [1,2,3]
print(arr1?.count)     //optional 3
print(arr1?[1])
arr1 = nil



if let firstRoomName = arr1?[0] {
  print("The first room name is \(firstRoomName).")
} else {
  print("Unable to retrieve the first room name.")  //nil이면 여기로 빠짐
}


var arr2: [Int?] = [1,2,3]
arr2.append(nil)  //arry 내부 요소가 optional이기 때문에 nil이 들어가짐
//arr2 = nil   이건 불가, arry가 존재하므로 nil로 바꿀수 없다.
arr2.count
arr2[1]
arr2.last


/*:
 ---
 ## Optional Function Types
 ---
 */
print("\n---------- [ Optional function types ] ----------\n")

//return도 optinal int, someClosure 자체도 optional
var someClosure: (() -> Int?)? = {
  return 10
}

print(someClosure)
//print(someClosure!())

someClosure?()
someClosure!()

someClosure = nil
someClosure?()
//someClosure!()    nil이라 error




//: [Next](@next)
