//: [Previous](@previous)
/*:
 # Literals & Types
 * 상수 - 고정된 값 (메모리 주소) 을 가지는 심볼/식별자
 * 리터럴
   - 소스코드에서 고정된 값으로 표현되는 문자 (데이터) 그 자체
   - 정수 / 실수 / 문자 / 문자열 / 불리언 리터럴 등
 */

/*:
 ---
 ## Numeric Literals
 ---
 */
var signedInteger = 123
signedInteger = +123
signedInteger = -123
type(of: signedInteger)

let decimalInteger = 17
let binaryInteger = 0b10001
type(of: binaryInteger)
let octalInteger = 0o21
let hexadecimalInteger = 0x11

// var bigNumber = 1000000000
// 아래는 사람이 보기 좋게 _로 자릿수를 끊은 것 (숫자 사이 _는 무시된다)
var bigNumber = 1_000_000_000
bigNumber = 000_001_000_000_000
bigNumber = 0b1000_1000_0000
bigNumber = 0xAB_00_FF_00_FF

/*:
 ---
 ## Integer Types
 *  8-bit : Int8, UInt8
 * 16-bit : Int16, UInt16
 * 32-bit : Int32, UInt32
 * 64-bit : Int64, UInt64
 * Platform dependent : Int, UInt (64-bit on modern devices)
 ---
 */

var integer = 123
integer = -123
type(of: integer)

// UInt는 타입 추론이 안되므로 명시 해주어야 함
var unsignedInteger: UInt = 123
//unsignedInteger = -123
type(of: unsignedInteger)

// 2^16 = (-2^15 ~ 2^15)

// 타입에 대한 메모리 사이즈, 메모리 범위를 확인 가능
// -2^63 ~ 2^63
MemoryLayout<Int>.size
Int.max
Int.min

MemoryLayout<UInt>.size
UInt.max
UInt.min
//playground bug.. 이상하면 print로 출력해보기
//let uintMax : UIint = UInt.max
//print(uint)

MemoryLayout<Int8>.size
Int8.max
Int8.min

MemoryLayout<UInt8>.size
UInt8.max
UInt8.min

MemoryLayout<Int16>.size
Int16.max
Int16.min

MemoryLayout<UInt16>.size
UInt16.max
UInt16.min

MemoryLayout<Int32>.size
Int32.max
Int32.min

MemoryLayout<UInt32>.size
UInt32.max
UInt32.min

MemoryLayout<Int64>.size
Int64.max
Int64.min

MemoryLayout<UInt64>.size
UInt64.max   // Playground Bug
UInt64.min
print(UInt64.max)   // 18,446,744,073,709,551,615


/*:
 ---
 ### Question
 - UInt에 음수를 넣으면?
 - Int8 에 127 을 초과하는 숫자를 넣으면?
 - Int 에 Int32.max ~ Int64.max 사이의 숫자를 넣었을 경우 생각해야 할 내용은?
 ---
 */
// q1. error

// q2. 생각해보기

// q3.
//let someNumber : Int = Int64.max - Int32.max + 10
//word (cpu가 한번에 전송하는 메모리의 양)
//32bit OS인지 64bit OS인지 확인
//따라서 32bit OS에서는 문제가 됨 (어지간하면 64bit OS)
// -----------------------

//let q1: UInt8 = -1

//overflow (error)
// type 명시를 미리 해주었으므로 실행 안시켜도 error
//let q2: Int8 = Int8.max + 1
//let q2: Int8 = 127 + 1

// 실행 중단 에러, 실행 시켰을때 error
//128이라는 크기를 Int8에 넣는것
//Runtime과정에서 변환하여 집어넣는것이므로, 실행시킨 후 error
//let q2 = Int8(127 + 1)

//let q3 = Int(Int32.max) + 1

//Int32.max + 1
//Int64.max + 1

// Int32.max
// Int64.max

// Overflow addition operator (오버플로우를 무시하고 계산하게 하는 것.. Min과 Max값이 뒤바뀌게 된다)
// 01111111  1000000 // 비트연산을 하므로 최댓값이 오히려 마이너스 최댓값이 되어버림.. -> ( 127 + 1 ) -> 128이 아니라 -128

Int8.max &+ 1
Int32.max &+ 1
Int64.max &+ 1

Int8.min &- 1       // (1000000 -1)  -> 01111111 (=Int8의 Max값)
Int32.min &- 1
Int64.min &- 1

/*:
 ## Floating-point Literal
 */
var floatingPoint = 1.23
floatingPoint = 1.23e4
floatingPoint = 0xFp3       // 16진수 -> 15 * 2^3
type(of: floatingPoint)     // double type


// float 사용시 명시 해주어야함 (기본 double)
var floatingPointValue = 1.23
type(of: floatingPointValue)

var floatValue: Float = 1.23
type(of: floatValue)

MemoryLayout<Float>.size
Float.greatestFiniteMagnitude   // FLT_MAX
Float.leastNormalMagnitude   // FLT_MIN

MemoryLayout<Double>.size
Double.greatestFiniteMagnitude   // DBL_MAX
Double.leastNormalMagnitude   // DBL_MIN


/***************************************************
 Double - 최소 소수점 이하 15 자리수 이하의 정밀도
 Float - 최소 소수점 이하 6 자리수 이하의 정밀도
 부동 소수점이므로 소수점 이하의 정밀도는 변경 될 수 있음
 ***************************************************/

/*:
 ---
 ## Boolean Literal
 ---
 */
var isBool = true
type(of: isBool)

isBool = false
//isBool = False        // XXXXXXX
//isBool = 1            // XXXXXXX
//isBool = 0            // XXXXXXX

let shouldChange: Bool = true       // true or false만 사용해야함..ㅠㅜ

/*:
 ---
 ## String Literal
 ---
 */
let str = "Hello, world!"
type(of: str)

let str1 = ""
type(of: str1)

var language: String = "Swift"

/*:
 ---
 ## Character Literal
 ---
 */

var nonCharacter = "C"
type(of: nonCharacter)

var character: Character = "C"      // 'C' != Character type    // "C"로 하고 타입 명시
type(of: character)

MemoryLayout<String>.size
MemoryLayout<Character>.size

// 공백, 하나의 문자 : Character   // 아무것도 없거나, 여러 문자 : String
character = " "
type(of: character)

//character = ""
//character = "string"


/*:
 ---
 ## Typealias
 - 문맥상 더 적절한 이름으로 기존 타입의 이름을 참조하여 사용하고 싶을 경우 사용
 ---
 */
// type 명칭을 명시하기

// typealias <#type name#> = <#type expression#>


// 오디오 샘플 목적으로 사용되는 변수다라는 것을 명시하기
typealias AudioSample = UInt16

var maxAmplitudeFound = AudioSample.min
var maxAmplitudeFound1 = UInt16.min

type(of: maxAmplitudeFound)
type(of: maxAmplitudeFound1)





/*:
 ---
 ### Question
 - Typealias 를 실제로 어떤 식으로 사용하고 있는지 직접 찾아볼 것
 ---
 */
// Apple framework
// 해당 변수 등에서 command click -> JumptoDefinition -> 관련된 헤더파일로 이동 -> 내부적으로 어떻게 사용되고있고 어떤변수가 있는지 볼 수 있음

//: [Next](@next)
