//: [Previous](@previous)
/*:
 **function** - named code block
 
 **closure** - unnamed code block (lambdas)
 */
//: ## Basic Closure
print("\n---------- [ Basic 1] ----------\n")
let simpleClosure = { //() -> () in    이게 생략된거
  print("This is SimpleClosure!!")
}
simpleClosure  //정의가 뭔지 확인
simpleClosure()  //()가 실행을 시켜주는거


({
    print("This is simple Closure!")
}) () //1회성

print("\n---------- [ Basic 2] ----------\n")

//중괄호 안에 input -> output을 넣고 in으로 code 부분 구분
let closureParameter = { (str: String) -> Int in
    print(str)
    return str.count
}

closureParameter("pigfactory")
let count = closureParameter("Swift")
print(count)
count   //Q>프린트는 안됨, why???-------------------------------------------------------
//Q>count() 이거는 왜 실행 안됨?-------------------------------------------------------

let count2 = closureParameter
print(count2)   //type을 출력

print("\n---------- [ Basic 3] ----------\n")

func voidFunction() {
  print("111")
}
let var1 = voidFunction   //func도 클로저의 일부기 때문에 가능


//표현 방법1
let var2: ()->() = {
  print("222")
}
var1()
var2()


//표현 방법2
let var3 = { () -> () in
    print("333")
}
var3()

//표현 방법3
({
  print("This is closure")
})()

/*:
 ## Inline closure
 */
print("\n---------- [ Inline ] ----------\n")
func printSwift() {
  print("Swift")
}
let arg = {
  print("Inline Closure!!")
}
func closureParamFunction(closure: () -> Void) { //Q>closure: () -> void 이거 자체가 클로저 인가???---------------------
  closure()
} //input이 없고 output이 void인 함수 또는 클로저 아무거나 넣어도 상관없다

closureParamFunction(closure: printSwift)    //Q>상단 {} 안의 closure() 가 printSwift()로 변해서 사용되는 원리?------------
closureParamFunction(closure: arg)

closureParamFunction(closure: {
  print("explicit closure parameter name")
})  //가장 많이 쓰는 방식

closureParamFunction(closure: { () -> () in
    print("same same")
})  //arguement에 넣은 부분을 클로저로 작성할수 있음

/*:
 ## Trailing Closure
 */
print("\n---------- [ Trailing ] ----------\n")
//마지막 클로저의 경우 이름을 생략가능

closureParamFunction() {
  print("Trailing")
}

closureParamFunction {
  print("Trailing")
}

func closureParamFunction2(closure1: () -> Void, closure2: () -> Void) {
  closure1()
  closure2()
}

closureParamFunction2(closure1: {
  print("inline")
}, closure2: {
  print("inline")
})

//trailing 괄호 위치 주의
closureParamFunction2(closure1: {
  print("inline")
}) {
  print("trailing")
}
/*:
 ## Syntax Optimization
 */
print("\n---------- [ Syntax Optimization ] ----------\n")
func printValue(value: Int) {
    print(value)
}
printValue(value: 10)

func performClosure(param: (String) -> Int) {
  print(param("Swift"))
}
//return값이 없는데도 오류가 안나는것처럼 보이는 이유는 위에 ((string) -> Int))이기 때문에 만약 ((string)) -> int 가 되면 오류가 발생
//괄호를 잘보면 저기의 Int는 performClosure함수의 리턴값이 아니기 때문에
//(param: ()->() ) 이거 자체가 클로저 이고 내부의 param()은 이 클로저를 호출한것

performClosure(param: { (str: String) -> Int in
  return str.count
})  //Q>이거는 위의 param 클로저를 수정한것? 정의? 재정의한것? --------------------------------------------------------------

performClosure(param: { (str: String) in
  return str.count
}) //str.count가 Int 타입이기 때문에 생략가능-> 타입추론가능

performClosure(param: { str in
  return str.count
}) //위에 func을 선언해줄때 string으로 정의해줬기 때문에 생략 가능

performClosure(param: ){ str in
    return str.count
} //Q>이렇게도 표현가능????---------------------------------------------------------------------------------

performClosure(param: {
  return $0.count
}) //변수명을 생략가능 -> 대신 $0으로 표현, 변수명이 생략되었기 때문에 in 도 생략
//첫번째 변수는 $0, 두번째 변수는 $1 이런식으로 표현 가능

performClosure(param: {
  $0.count
}) //다른 code가 없기 때문에 return도 생략, 만약 print 명령어가 있었으면 생략 불가

performClosure(param: ) {
  $0.count
}

performClosure() {  $0.count
} //마지막 클로저는 생략가능(trailing) 하기 때문에 생략

performClosure { $0.count }

//: [Next](@next)
