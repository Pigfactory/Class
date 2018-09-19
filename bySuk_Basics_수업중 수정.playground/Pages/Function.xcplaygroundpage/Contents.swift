//: [Previous](@previous)
/*:
 # Function
 - 일련의 작업을 수행하는 코드 묶음을 식별할 수 있는 특정한 이름을 부여하여 사용하는 것
 - 유형
   - Input 과 Output 이 모두 있는 것 (Function)
   - Input 이 없고 Output 만 있는 것 (Generator)
   - Input 이 있고 Output 은 없는 것 (Consumer)
   - Input 과 Output 이 모두 없는 것
 */

/*:
 ## Function Syntax
 ![Function Syntax](func.png)
 
 ### Parameter Declaration Syntax
 ![Parameters](param.png)
*/

func greet(person: String) -> String {
  let greeting = "Hello, " + person + "!"
  return greeting
}

greet(person: "Anna")
greet(person: "Brian")


// Combine the message creation and the return statement into one line

func greetAgain(person: String) -> String {
  return "Hello again, " + person + "!"
}

greetAgain(person: "Anna")


// Function with Multiple Parameters

func addNumbers(a: Int, b: Int) -> Int {
  return a + b
}

addNumbers(a: 10, b: 20)
addNumbers(a: 3, b: 5)


/*:
 ---
 ## Argument Label
 
 ### Argument Label Declaration Syntax
 
 ![Argument Label](arg-label.png)
 
 ### Calling Function with Argument Label
 ![Calling Function with Argument Label](arg-call.png)
 */

// Function Argument Labels and Parameter Names


// By default, parameters use their parameter name as their argument label.

func someFunction(firstParameterName: Int, secondParameterName: Int) {
  print(firstParameterName, secondParameterName)
}

someFunction(firstParameterName: 1, secondParameterName: 2)


// Omitting Argument Labels(언더바를 사용하면 이름을 생략가능)

func someFunction(_ firstParameterName: Int, secondParameterName: Int) {
  print(firstParameterName, secondParameterName)
}

//someFunction(firstParameterName: 1, secondParameterName: 2)
someFunction(1, secondParameterName: 2)


// Specifying Argument Labels

func someFunction(argumentLabel parameterName: Int) {
  // parameterName refers to the argument value for that parameter.
  print(parameterName)
}

someFunction(argumentLabel: 10)


// Question
// 왜 Argument Label - Parameter Name 따로 쓰는 지
// 5.distance(to: 10)   to

// Argument Label 을 생략하는 경우는 왜 생략하는지
// => print



// Default Parameter Values

func functionWithDefault(paramWithoutDefault: Int, paramWithDefault: Int = 12) -> Int {
  return paramWithDefault
}

functionWithDefault(paramWithoutDefault: 3, paramWithDefault: 6)
// parameterWithDefault is 6

functionWithDefault(paramWithoutDefault: 4)
// parameterWithDefault is 12



// Variadic Parameters
// variadic parameters cannot be marked as inout.

func arithmeticMean(_ numbers: Double...) -> Double {
  var total = 0.0
  for number in numbers {
    total += number
  }
  return total / Double(numbers.count)
}

arithmeticMean(1, 2, 3, 4, 5)
arithmeticMean(3, 8.25, 18.75)

//print(10,20,30,40,50)
//print(1,2,3,4,5,6,7)
/*:
 ---
 ### Question
 - 위의 Variadic Parameter 외에 추가로 다른 숫자를 입력 파라미터로 받는 함수를 만들어보기
 ---
 */
// ...을 _ 과 같이 쓸려면 _을 앞에 쓰고 ...을 뒤에 쓰는게 좋음
// 아래 함수를 사용할 시 에러 발생, 타입이 달라도 마찬가지

//func arithmeticMean(_ numbers: Double..., _ last: Double) -> Double {
//  print(numbers)
//  print(last)
//}

//arithmeticMean(1, 2, 3, 5)


//func arithmeticMean(_ numbers: Double..., and last: Double) -> Double {
//  print(numbers)
//  print(last)
//}
//

//arithmeticMean(1, 2, 3, and: 5)


/*:
 ## Argument vs Parameter
 
 ![argparam](arg-param.png)
 - Parameter
   - 매개변수 = 인자 = Parameter
   - 인수를 담는 변수의 한 종류로서 해당 함수 내부 스코프에만 영향
   - 대부분 call by value 가 기본
   - call by reference 는 호출할 때 사용한 전달인자에까지 영향
 - Argument
   - 전달인자 = 인수 = 실인수 = Argument
   - 함수 호출 시 그에 필요한 데이터를 전달
 */


/*:
 ---
 ## Functions Without Parameters
 ---
 */

func sayHelloWorld() -> String {
  return "hello, world"
}

print( sayHelloWorld() )
print( "hello, world" )

/*:
 ---
 ## Functions Without Return Values
 ---
 */

func say(number: Int) {
  print(number)

}

func say(word: String) -> Void {
  print(word)

}

//void = return empty

func say(something: String) -> () {
  print(something)
}

say(number: 1)
say(word: "1")
say(something: "1")


/*:
 ---
 ## Nested Functions
 - 외부에는 숨기고 함수 내부에서만 사용할 함수를 중첩하여 사용 가능
 ---
 */
func chooseStepFunction(backward: Bool, value: Int) -> Int {
  func stepForward(input: Int) -> Int {
    return input + 1
  }
  func stepBackward(input: Int) -> Int {
    return input - 1
  }
  
  if backward {
    return stepBackward(input: value)
  } else {
    return stepForward(input: value)
  }
}


var value = 4
chooseStepFunction(backward: true, value: value)
chooseStepFunction(backward: false, value: value)



/*:
 ---
 ## Practice
 - 이름을 입력 값으로 받아서 출력하는 함수
 - 나이를 입력 값으로 받아서 출력하는 함수
 - 이름과 나이를 입력 받아 자신을 소개하는 글을 출력하는 함수
 - 정수를 하나 입력받아 2의 배수 여부를 반환하는 함수
 - 정수를 두 개 입력받아 곱한 결과를 반환하는 함수 (파라미터 하나의 기본 값은 10)
 - 4과목의 시험 점수를 입력 받아 평균 값을 반환해주는 함수
 ---
 */
//Q1>
func whatIsYourName(name: String) {
    print ("'1'Your name is: ", name)
}
whatIsYourName(name: "franky")

func whatIsYourName2(name: String) -> String{
    print ("'2'Your name is: ", name)
    return "Sup"
}
whatIsYourName2(name: "Kate")

//Q2>
func whatIsYourAge(age: Int){
    print ("Your Age is: ", age)
}
whatIsYourAge(age: 88)

//Q3>
func nameAndAge(name: String, age: Int){
    print ("name: ", name, "\n", "age: ", age)
}
nameAndAge(name: "Bob", age: 33)

//Q4>
func number(num: Int) -> String{
    if num % 2 == 0 {
        print("its even number")
        return "even"
    }
    else{
        print("its odd number")
        return "odd"
    }
}
number(num: 23); number(num: 88)

//Q5>
func multiplyNums(num1: Int, num2: Int = 10) -> Int{
    print(num1 * num2)
    return num1 * num2
}
multiplyNums(num1: 5)

//Q6>
func score(A: Int, B: Int, C: Int, D: Int) -> Int{
    print ((A+B+C+D)/4)
    return (A+B+C+D)/4
}
score(A: 40, B: 14, C: 99, D: 30)

//Q7
func yourScoreIs(Score: Int) -> String{
    if Score >= 90 {
        return "A"
    }
    else if Score >= 80 {
        return "B"
    }
    else if Score >= 70 {
        return "C"
    }
    else{
        return "F"
    }
}
yourScoreIs(Score: 60)

//Q8
func averageScore(Score: Int...) -> String{
    let numScore = Score.count
    var sum = 0
    for each in Score{
        sum += each
    }
    let average = (sum/numScore)
    print (average)
    
    if average >= 90 {
        return "A"
    }
    else if average >= 80 {
        return "B"
    }
    else if average >= 70 {
        return "C"
    }
    else{
        return "F"
    }
    
}

averageScore(Score: 99,95,99,99,98,10)
//: [Next](@next)
