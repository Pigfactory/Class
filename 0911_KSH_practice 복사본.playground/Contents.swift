//: Playground - noun: a place where people can play

import UIKit


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




/*:
 ---
 ### Question
 for , while , repeat - while 등을 골고루 활용하여 아래 문제들을 구현해보세요.
 1. 1 ~ 9 사이의 숫자를 입력받아 해당 숫자에 해당하는 구구단의 내용을 출력하는 함수
 2. 정수 하나를 입력받아 그 수의 Factorial 을 구하는 함수
 3. 정수 두개를 입력받아 첫 번째 수를 두 번째 수의 횟수만큼 곱한 값을 반환하는 함수
 4. 정수 하나를 입력받아 각 자리수 숫자들의 합을 반환해주는 함수
 5. 100 이하의 자연수 중 3과 5의 공배수를 모두 출력하는 함수
 ---
 */

//Q1>
func timesTable(a: Int) {
    for i in 1...9 {
        print ("\(a)", "X", "\(i)", "=", "\(a * i)")
    }
}
timesTable(a: 4)

//Q2-1>
func factorial(a: Int) {
    var total = a
    for i in 1...(a-1) {
        total *= (a-i)
        print("\(i)", "X", terminator: " ")
    }
    print ("\(a)", "=", "\(total)")
}
factorial(a: 5)

//Q2-2> reversed 써서 해보기

//Q3>
func multiX(a: Int, b: Int) {
    var total = 1
    for _ in 1...b {
        total *= a
        //print("\(a)", "X", terminator: " ")
    }
    print("=", "\(total)")
}
multiX(a: 3, b: 4)

//Q4>
func sumNumbers(a: Int) {
    var sum: Int = 0
    for i in String(a) {
        let c = Int(String(i)) //이게 optional로 넘어가서 !를 써야만 되는 이유는 char중에 int로 변환안되는게 있기 때문에 그럼.
        //따라서 변환안되는 경우를 else로 해서 return nil 로 해주면 !를 안쓰고도 해결됨
        sum += c!   //이렇게 말고 다른 방법이 있나? (!: 강제 추출??)
    }
    print (sum)
    print (type(of: sum))
}
sumNumbers(a: 432)

let a: String = "8"
let b = Int(a)
let c: Int = 900
let d = String(c)
let e = Int(d)
let f = Character(a)
let g = String(f)
let h = Int(g)

//Q5>
func commonTimes(z: Int) {
    var y = 1
    while y <= z {
        if y % 15 == 0 {
            print ("\(y)", terminator: " ")
        }
        y += 1
    }
}
commonTimes(z: 100)

print("\n")

var x = 100     //이건 왜 안되냐???????????!!! while은 참일때만 돌아감
while x >= 1 {      //x == 1로 하면 참이 아니기 때문에 진행 ㄴㄴ
    if x % 15 == 0 {
        print ("\(x)", terminator: " ")
    }
    x -= 1
}

print("\n-------------[Practice1]---------------\n")
//Practice1-1>
//2 이상의 정수를 입력받아, 소수인지 아닌지 판별하는 함수
func checkPrime(a: Int) {
    for i in 2...(a-1) {
        if a % i == 0 {
            print("\(a) is not a Prime!")
            return
        }
    }
    print("\(a) is a Prime!")
}
checkPrime(a: 557)

//Practice1-2> switch 이용해서 트라이 해보기



//Practice2>
//- 정수를 입력받아 그 정수의 약수를 모두 출력하는 함수
func numFactors(a: Int) {
    for i in 1...a {
        if a % i == 0 {
            print ("\(i)", terminator: " ")
        }
    }
    print("are factor of", "\(a)")
}
numFactors(a: 81)


//Practice3>
//- 정수를 입력받아 피보나치 수열 중에서 입력받은 수에 해당하는 자리의 숫자를 반환하는 함수
//(입력된 숫자가 4면 0, 1, 1, 2, 3, 5 ... 에서 4번째 위치인 2 출력.    참고로 피보나치 수열은 이전 두 수의 합이 다음 수가 되는 수열)
func fibo(a: Int) {
    var n1 = 0
    var n2 = 1
    var n3 = 0
    switch a {
    case a where a == 1:
        print("0")
    case a where a == 2:
        print("1")
    case a where a == 3:
        print("1")
    default:
        for _ in 3...(a-1) {
            n3 = n1 + n2
            n3 = n3 + n2
            n1 = n2
            n2 = n3 - n2
            print ("\(n3)")
        }
    }
}
fibo(a: 5)
fibo(a: 2)


