//: [Previous](@previous)
/*:
 # Conditional Statements
 */

/*:
 ---
 ## if Statements
 ---
 */
/***************************************************
 if <#condition#> {
 <#code#>
 }
 
 if <#condition#> {
 <#statements#>
 } else {
 <#statements#>
 }
 
 - condition 은 Bool 값 (true, false)
 ***************************************************/

// if

var temperatureInFahrenheit = 30

if temperatureInFahrenheit <= 32 {
  print("It's very cold. Consider wearing a scarf.")
}


// if - else

temperatureInFahrenheit = 40

if temperatureInFahrenheit <= 32 {
  print("It's very cold. Consider wearing a scarf.")
} else {
  print("It's not that cold. Wear a t-shirt.")
}


// if - else if - else

temperatureInFahrenheit = 90

if temperatureInFahrenheit <= 32 {
  print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
  print("It's really warm. Don't forget to wear sunscreen.")
} else {
  print("It's not that cold. Wear a t-shirt.")
}


// if - else if

temperatureInFahrenheit = 72
if temperatureInFahrenheit <= 32 {
  print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
  print("It's really warm. Don't forget to wear sunscreen.")
}

/*:
 ---
 ### Question
 - if ~ else if   /  if 문을 2개 하는 것과 차이점?
 - if ~ else if 만 있을 때 else 없이 동일하게 처리하려면?
 ---
 */
//0 ^ 0 0
//0 ^ 1 1
//1 ^ 0 1
//1 ^ 1 0


// Logical And Operator
if (temperatureInFahrenheit > 0) && (temperatureInFahrenheit % 2 == 0) {
}

// Logical And Operator
if temperatureInFahrenheit > 0, temperatureInFahrenheit % 2 == 0 {
}

/*:
 ---
 ## switch Statements
 ---
 */
/***************************************************
 switch <#value#> {
 case <#value 1#>:
     <#respond to value 1#>
 case <#value 2#>,
      <#value 3#>:
     <#respond to value 2 or 3#>
 default:
     <#otherwise, do something else#>
 }
 
 - switch 문은 가능한 모든 사례를 반드시 다루어야 함 (Switch must be exhaustive) 
 ***************************************************/

print("\n---------- [ switch statements ] ----------\n")

let alphabet: Character = "a"

switch alphabet {
case "a":
  print("The first letter of the alphabet")
case "z":
  print("The last letter of the alphabet")
default:
  // Invalid, the case has an empty body, 마지막을 비워둘수 없다, break나 print 뭐든지 넣어야됨
  break
//  print("Some other character")
}


// Interval Matching

print("\n---------- [ Interval Matching ] ----------\n")

let approximateCount = 200

switch approximateCount {
case 0...50:
    print("0 ~ 50")
case 51...100:
    print("51 ~ 100")
case 101...:
    print("over 100")
case 100..<200:
    print("huho")
default:
    print("Something else")
}


// Compound Cases

let someCharacter: Character = "e"

switch someCharacter {
case "a", "e", "i", "o", "u":
  print("\(someCharacter) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
     "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
  print("\(someCharacter) is a consonant")
default:
  print("\(someCharacter) is not a vowel or a consonant")
}

//Coumpund case -> if
if someCharacter == "a" || someCharacter == "i" || someCharacter == "e" || someCharacter == "o" || someCharacter == "u" {
    print("\(someCharacter) is a vowel")
    }else{
        print("i dont know what it is")
    }

//Coumpund case -> if 이렇게 하면 안됨, 콤마(,)는 && 연산
if someCharacter == "a", someCharacter == "i", someCharacter == "e", someCharacter == "o", someCharacter == "u" {
    print("\(someCharacter) is a vowel")
}else{
    print("i dont know what it is")
}

/*:
 ---
 ### Question
 - Compound Case 를 if 문으로 변경하기
 ---
 */



// value binding

let stillAnotherPoint = (9, 0)  //여러변수를 하나의 변수에 넣을수도 있음

switch stillAnotherPoint {
case (let distance, 0), (0, let distance):
  print("On an axis, \(distance) from the origin")
default:
  print("Not on an axis")
}


// where clause

let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y: // case (let x, let y) where x == y: 와 동일
  print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y: //Q> where 는 어떻게 쓰인거?
  print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
  print("(\(x), \(y)) is just some arbitrary point")
}


// Without default case
// 모든 경우를 다 만족시켰으므로 default를 넣으면 오히려 에러가 발생

let isTrue = true
type(of: isTrue)

switch isTrue {
case true:
  print("true")
case false:
  print("false")
}


// fallthrough

print("\n---------- [ fallthrough ] ----------\n")
let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"

switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
  description += " a prime number, and also"
  fallthrough  //바로 아래까지만(한단계만) 통과됨
default:
  description += " an integer."
}
print(description)


/*:
 ---
 ## Early Exit
 - guard statement
 ---
 */
func update(age: Int) {
  if 0...100 ~= age {    //~= age가 앞의 범위에 포함되는지 확인하는 연산자, 포함되면 true
    print("OK")
  }
}

update(age: 10)


/***************************************************
 if <#condition#> {
 <#code#>
 }
 
 guard <#condition#> else {
 <#code#>
 }
 ***************************************************/

func update1(age: Int) {
    guard 0...100 ~= age  //조건을 만족시켰을 때 else를 pass하고 print로 간다, 만족안하면 else {} 실행
//    , age == 100
    else { return }
    print("Pass")
}
update1(age: 2)
update1(age: -1)
update1(age: 100)


/*:
 ---
 ## Question  (switch 를 이용해서 구현)
 - 두 개의 정수를 입력받아 두 수를 하나의 숫자로 이어서 합친 결과를 출력하는 함수 (1, 5 입력 시 15 반환)
 - 문자열 두 개를 입력받아 두 문자열이 같은지 여부를 판단해주는 함수
 - 학점을 입력받아 각각의 등급을 반환해주는 함수 (4.5 = A+,  4.0 = A, 3.5 = B+ ...)
 - 세 수를 입력받아 세 수의 곱이 양수이면 true , 음수이면 false 반환하는 함수  (switch - where clause 사용할 것)
 - 특정한 달을 숫자로 입력 받아 문자로 반환해주는 함수 (1 = "Jan" , 2 = "Feb")
 - 윤년 구하기 (2월 29일이 있는 해.  매 4년 마다 윤년. 매 100년 째에는 윤년이 아님. 매 400년 째에는 윤년)
 ---
 */

//Q1-1>
func attach(a: Int, b: Int){
    print("\(a)\(b)")
}
attach(a:1, b:3)

//Q1-2>
func attach2(a: Int, b: Int){
    let numbers = (a, b)
    switch numbers {
    case (a, b):
        print("\(a)\(b)")
    default:
        print("cant")
    }
}
attach2(a:1, b:30)

//Q1-3>
let eachnumber = (1, 2)
switch eachnumber {
case let (x, y):
    print("\(x)\(y)")
}


//Q2-1>
func matchCheck(a: Character, b: Character){
    if a == b {
        print("its same")
    }
    else {
        print("its different")
    }
}
matchCheck(a:"k", b:"k")

//Q2-2>
func matchCheck2(a: Character, b: Character){
    let checking = (a, b)
    switch checking {
    case let (a, b) where a == b:
        print("its same")
    default:
        print("its different")
    }
}
matchCheck2(a:"k", b:"k")
matchCheck2(a: "i", b: "p")


//Q3>
func testScore(a: Double) -> String {
    switch a {
    case 4.5:
        print ("A+")
        return "A+"
    case 4.0:
        print ("A")
        return "A"
    case 3.5:
        print ("B+")
        return "B+"
    default:
        print("Die")
        return "Die"
    }
    //return "finish"  스위치 모든 케이스에 return값이 들어가면 func에 return값이 필요없어진다
}
testScore(a: 4.5)
testScore(a: 3.0)
testScore(a: 4)

//Q4>
func checkPN(a: Int, b: Int, c:Int){
    let checking = (a, b, c)
    switch checking {
    case let (a, b, c) where a*b*c > 0:
        print("its positive")
    case let (a, b, c) where a*b*c < 0:
        print("its negative")
    default:
        print("0")
    }
}
checkPN(a:1, b:2, c:3)
checkPN(a:100, b:1, c:0)
checkPN(a:-1, b:-1, c:-1)

//Q5>
func specialMonth(a: Int){
    let month = a
    switch month {
    case 1:
        print("JAN")
    case 2:
        print("FEB")
    default:
        print("not special")
    }
}
specialMonth(a: 1)
specialMonth(a: 5)

//Q6>
func year(a: Int) {
    switch a {
//    case a where (a % 4 == 0) && (a % 400 != 0) && (a % 100 != 0):
//        print ("\(a)년 is", "윤년")
//    case a where (a % 4 == 0) && (a % 400 == 0) && (a % 100 == 0):
//        print ("\(a)년 is", "윤년")
//    case a where (a % 4 != 0) && (a % 400 == 0) && (a % 100 == 0):
//        print ("\(a)년 is", "윤년")
    case a where (a % 400 == 0) || (a % 4 == 0) && (a % 100 != 0):
//        print ("\(a)년 is", "윤년")
//    case a where ((a % 4 == 0) && (a % 100 != 0)) || (a % 400 == 0):
        print ("\(a)년 is", "윤년")
    default:
        print ("\(a)년 is", "not윤년")
    }
}
year(a: 60)
year(a: 100)
year(a: 4)
year(a: 800)
year(a: 2018)

// "-" = && 로 해석
// "+" = || 로 해석
//: [Next](@next)
