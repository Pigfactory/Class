//: [Previous](@previous)
/*:
 # Loops
 - For-In Loops
 - While Loops
   - while
   - repeat-while
 */
/*:
 ---
 ## For-In Loops
 ---
 */
print("\n---------- [ for ] ----------\n")
/***************************************************
 for <#item#> in <#items#> {
 <#code#>
 }
 ***************************************************/

//for (int i = 0; i <= 5; i++) {
//   C 스타일의 for 문
//}

for index in 1...4 {
  print("\(index) times 5 is \(index * 5)")
}

// Wildcard Pattern

for _ in 0...3 {
  print("hello")
}


for chr in "Hello" {
  print(chr, terminator: " ")  //terminator를 지정안해주면 \n 값이 기본으로 들어가서 한줄 내려감(엔터)
}
print()

let list = ["Swift", "Programming", "Language"]
for str in list {
  print(str)
}


/*:
 ---
 ### Question
 - for 문을 이용하여 3 의 10 제곱에 대한 결과값을 표현하는 코드 구현
 - for 문을 이용하여 10부터 1까지 내림차순으로 출력하는 코드 구현
 ---
 */
//Q1>
var num2: Int = 3

for _ in 1...10 {
    num2 *= 3
    print(num2, terminator: " ")
}
print("\n")
print(num2)

//Q2>
for num3 in 0...9 {
    var result: Int
    result = 10 - num3
    print(result, terminator: " ")
}
print("\n")





let base = 3
let power = 10
var answer = 1

for _ in 1...power {
  answer *= base
}
print("\(base) to the power of \(power) is \(answer)")


for num in (1...10).reversed() {
  print(num, terminator: " ")
}
print()


/*:
 ---
 ## While Loops
 - 조건이 거짓이 될 때까지 일련의 명령문 수행
 - 첫 번째 반복이 시작되기 전에 반복 횟수를 알지 못할 때 많이 사용
 - while  /  repeat-while
 ---
 */
print("\n---------- [ while ] ----------\n")
/***************************************************
 while <#condition#> {
 <#code#>
 }

 - 루프를 통과하는 각 패스의 시작 부분에서 조건을 평가
 ***************************************************/


var num = 0
var sum = 0

while num <= 100 {
  sum += num
  num += 1
}

sum


/***************************************************
 repeat {
 <#code#>
 } while <#condition#>
 
 - 루프를 통과하는 각 패스의 끝 부분에서 조건을 평가
 - 다른 언어에서는 do - while 문으로 많이 사용
 ***************************************************/

num = 0
sum = 0

repeat {

  sum += num
  num += 1
} while num <= 100

sum

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
//: [Next](@next)
