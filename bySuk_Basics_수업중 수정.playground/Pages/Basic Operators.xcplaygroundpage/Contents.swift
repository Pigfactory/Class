//: [Previous](@previous)
/*:
 # Basic Operators
 */
/*:
 ---
 ## Terminology
 ---
 */
let a = 123
let b = 456
let c: Int? = 789
//Int? : 타입의 값이 있을수도 있고 없을수도 있다. nil이 올수도 있고... 정확히 모름

// Unary Operator (단항 연산자)
-a

// Prefix (전위 표기법)
-a

// Postfix (후위 표기법)
c!


// Binary Operator (이항 연산자)
a + b

// Infix (중위 표기법)
a + b


// Ternary Operator (삼항 연산자)
// Swift 에서 삼항 연산자는 단 하나
a > 0 ? "positive" : "negative"

//아래를 상단 한줄로 표현할때 쓰는 방법 : 삼항연산자
if a > 0 {
  "positive"
} else {
  "negative"
}


/*:
 ---
 ## Assignment Operators
 ---
 */

// Basic assignment operator
var value = 0

// Addition assignment operator
value = value + 10

// Subraction assignment operator
value = value - 5

// Multiplication assignment operator
value = value * 2

// Division assignment operator
value = value / 2

// Modulo assignment operator
value = value % 2

// Compound Assignment Operators
value += 10
value -= 5
value *= 2
value /= 2
value %= 2

// not support : value++ , value--

//value++  : 이건 지원안됨
//value += 1
//value = value + 1

//var (x, y) = (1, 2)
//if x = y {
// This is not valid, because x = y does not return a value.
// x == y 로 하면 괜찮음
//}

/*:
 ---
 ## Arithmetic Operators
 ---
 */
// Unary plus opertor
+a

// Addition Operator
a + b

"Hello, " + "world"
"Hello, " + String(a)

// Unary minus Operator
-a

// Subtraction Operator
a - b

// Multiplication Operator
a * b

// Division Operator
b / a

// Modulo operator
b % a


// 실수에서의 나눗셈
let e = 123.4
let f = 5.678

// 나누기
e / f

// 나머지1
// 실수는 e % f 지원 안함, 아래 함수를 사용해야됨
e.truncatingRemainder(dividingBy: f)   //
//(123.4 - x) / (5.678 * 21 ) = 1

// 나머지2
e.remainder(dividingBy: f)  //
//123.4 - (5.678 * 22)
/*:
 ---
 ## Question
 - 단순 나눗셈과 나머지의 차이
 - 나머지 2개의 차이점?
 ---
 */
let quotient = (e / f).rounded()
let remainder = e.remainder(dividingBy: f)
let sum = f * quotient + remainder




/*:
 ---
 ## Precedence
 ---
 */

1 + 2 * 3
1 + (2 * 3)
(1 + 2) * 3

1 + 2 * 3 + 3
1 + (2 * 3) + 3
1 + 2 * (3 + 3)

1 * 2 - 3
(1 * 2) - 3
1 * (2 - 3)

/*:
 ---
 ## Overflow Operators
 ---
 */

// Overflow addition
//var add: Int8 = Int8.max + 1
var add: Int8 = Int8.max &+ 1

// Overflow subtraction
//var subtract: Int8 = Int8.min - 1
var subtract: Int8 = Int8.min &- 1

// Overflow multiplication
//var multiplication: Int8 = Int8.max * 2
var multiplication: Int8 = Int8.max &* 2


/*:
 ---
 ## Comparison Operators
 ---
 */
// Equal to operator
a == b

// Not equal to operator
a != b

// Greater than operator
a > b

// Greater than or equal to operator
a >= b

// Less than operator
a < b

// Less than or equal to operator
a <= b


/*:
 ## Question
 - 숫자가 아닌 문자열에 대한 비교는?
 */

/*:
 ---
 ## Logical Operators
 ---
 */
let abc1 = "abc"
let abc2 = "ABC"
abc1 > abc2

let str1 = "cde"
let str2 = "한글"
str1 < str2

let A = "A" //65
let S = "S? //115"
str1 <  str2


// Logical AND Operator
true && true
true && false
false && true
false && false

// Logical OR Operator
true || true
true || false
false || true
false || false

// Logical Negation Operator
!true
!false


// Combining Logical Operators
let enteredDoorCode = true
let passedRetinaScan = false
let hasDoorKey = false
let knowsOverridePassword = true

var x = 0
func addOne() -> Bool {
  x += 1
  print("x")
  return true
}

var y = 0
func addTwo() -> Bool {
    y += 1
    print("y")
    return true
}

var z = 0
func addThree() -> Bool {
    z += 1
    print("z")
    return true
}

print ("------------------test 1 start---------------------")
//첫번째 addOne이랑 마지막 addOne만 출력됨 ???
//가운데 addOne은 어차피 false라 생략 ???
//***어차피 하나마나한 계산은 하지 않는다 ???
if addOne() && false && addOne() || addOne() {
    print("Open the door")
}else {
    print("Can't open the door")
}
print ("------------------test 1 end-----------------------")

print ("------------------test 2 start---------------------")
if addOne() && false && addTwo() || addThree() {
    print("Open the door")
}else {
    print("Can't open the door")
}
print ("------------------test 2 end-----------------------")


if enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword {
  print("Open the door")
} else {
  print("Can't open the door")
}
//


// Explicit Parentheses
if (enteredDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword {
  // ...
} else {
  // ...
}


/*:
 ## Question
 - 논리 연산자는 순서에 주의 필요. 순서를 신경 써야 하는 이유는?
 */
var ternary = 0
if ternary == 0 {
    print("true")
} else {
    print("false")
}

ternary == 0 ? "true" : "false"
/*:
 ---
 ## Ternary Conditional Operator
 ---
 */

a > 0 ? "positive" : "zero or negative"

if a > 0 {
  "positive"
} else {
  "zero or negative"
}

/*:
 ---
 ## Range Operators
 ---
 */
// Closed Range Operator
0...100 //0~100

for index in 1...5 {
  print("\(index) times 5 is \(index * 5)")
}


// Half-Open Range Operator
0..<100 //0~99

let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {   // 0,1,2,3
  print("Person \(i + 1) is called \(names[i])")
}

// One-Sided Ranges
1...
...100
..<100


//               0       1        2       3
//let names = ["Anna", "Alex", "Brian", "Jack"]
names[2...]
names[...2]
names[..<2]


/*:
 ## Question
 - 순서를 반대로 적용하려면?
 */
for i in (1...100){
    print(101-i)
}

for i in (1...100).reversed(){
    print(i)
}

//: [Next](@next)
