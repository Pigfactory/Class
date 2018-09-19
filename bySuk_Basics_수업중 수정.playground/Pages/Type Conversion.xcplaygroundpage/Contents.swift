//: [Previous](@previous)
/*:
 # Type Conversion
 */

let height = Int8(5)
type(of: height)

let width = 10
//let area = height * width
//에러발생, 타입이 다르기 때문에 Int8
//print(area)


let h = UInt8(25)
let x = 10 * h
print(x)

/*:
 ---
 ## Question
 - 7번째 라인 let area = height * width  부분은 에러가 발생하고
 - 13번째 라인 let x = 10 * h 에서는 에러가 발생하지 않는 이유는?
 ---
 */

let num = 10
let floatNum = Float(num)  //변환시켜주는 방법, let floatNum: Float = num 은 float으로 변환이 안됨
type(of: floatNum)

let signedInteger = Int(floatNum)
type(of: signedInteger)

let str = String(num)
type(of: str)



// magnitude, abs

let integer = Int(-15)
//let interger = -15 로 해도 아래가 적용됨
let magnitude = integer.magnitude
type(of: magnitude) // type이 Uint로 바뀜
let absNum = abs(integer)
type(of: absNum)  // type이 유지됨, 더 권장하는 방법
/*:
 ---
 ## Question
 - magnitude 와 abs 의 차이점은?
 - 양수를 사용할 때 Int / UInt 중 어느 것이 좋을까?
   - 사용성, 안전성, 타입 추론, 변환 등
 ---
 */
//A2> Int 를 더 선호함, 타입추론을 하면 UInt보다 Int로 추론하기 때문에
//: [Next](@next)
