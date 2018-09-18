//: [Previous](@previous)
import Foundation

/*:
 ## Dictionary
 - Element = Unique Key + Value
 - Unordered Collection
 */

/*:
 ### Dictionary Literal
 */


//var dictFromLiteral = ["key 1": "value 1", "key 2": "value 2"]
//type(of: dictFromLiteral)

//var dictFromLiteral = [1: "value 1", 2: "value 2"]

var dictFromLiteral = ["1": 1, "2": 2]
var dictFormLiteral_ex: [String : Any] = ["1": 1, "2": "kkk"]

//타입 명시를 해주지 않았기 때문에 에러발생
//var dictFromLiteral = [:]

//위에서 타입 명시가 되어 있기 때문에 이때는 이렇게 써도 됨
dictFromLiteral = [:]

/*:
 ### Dictionary Type
 */
let words1: Dictionary<String, String> = ["A": "Apple", "B": "Banana", "C": "City"]
let words2: [String: String] = ["A": "Apple", "B": "Banana", "C": "City"]
let words3 = ["A": "Apple", "B": "Banana", "C": "City"]

/*:
 ### Number of Elements
 */
var words = ["A": "Apple", "B": "Banana", "C": "City"]
let countOfWords = words.count

if !words.isEmpty {
  print("\(countOfWords) element(s)")
} else {
  print("empty dictionary")
}





/*:
 ### Retrieve an Element
 */

words["A"]
//print(words["A"])  -> optional 때문에 안됨

//->key 값에 없는것을 하면 nil 이 뜸
words["Q"]
//print(words["Q"])

if let aValue = words["A"] {
  print(aValue)
} else {
  print("Not found")
}

if let zValue = words["Z"] {
  print(zValue)
} else {
  print("Not found")
}

print(words.keys)
print(words.values)

let keys = Array(words.keys)
let values = Array(words.values)


/*:
 ### Searching
 */
//var words = ["A": "Apple", "B": "Banana", "C": "City"]

if words.contains(where: { (key, value) -> Bool in
  return key == "A"
  }){
  print("contains A key.")
}

if words.contains(where: { (dict) -> Bool in
  return dict.value.lowercased() == "City".lowercased()
}) {
  print("contains City value.")
} //Q>contains도 for 구문 처럼 반복하는 기능이 있나?

if words.contains(where: { $0.1.lowercased() == "City".lowercased() }) {
  print("contains City value.")
}

let filteringResult = words.filter { (key, value) -> Bool in
  return value.lowercased().contains("a")
} //filter 기능에 for문처럼 반복하는 기능이 있기때문에 3번 반복함


for (key, value) in filteringResult {
  print("\(key) - \(value)")
}

/*:
 ### Add a New Element
 */
words = ["A": "A"]

words["A"]    // Key -> Unique

words["A"] = "Apple"
words

words["B"] = "Banana"
words

words["B"] = "Blue"
words


/*:
 ### Change an Existing Element
 */
words = [:]
words["A"] = "Apple111"
words

words = [:]

//updatevalue 기능은 optional이다
if let oldValue = words.updateValue("Apple", forKey: "A") {
  print("\(oldValue) => \(words["A"]!)")
} else {
  print("+ \(words["A"]!)")
}

words

if let oldValue = words.updateValue("Apricot", forKey: "A") {
  print("\(oldValue) => \(words["A"]!)")
} else {
  print("+ \(words["A"]!)")
}


/*:
 ### Remove an Element
 */
//words = ["A": "Apple", "B": "Banana", "C": "City"]
words = ["A": "Apple", "B": "Banana", "C": "City", "Z": "Zoo"]
words["Z"] = "ZZZ"
words["Z"] = nil
words

words["EE"] = nil
words

let some = words.removeValue(forKey: "B")
words

words = ["A": "Apple", "B": "Banana", "C": "City",
         "D": "Drama", "E": "Earth", "F": "Fuel"]

if let removedValue = words.removeValue(forKey: "D") {
  print("\(removedValue) removed!")
}

words

words.removeAll()

/*:
 ### Enumerating an Dictionary
 */
print("\n----------------[Enumerating an dictionay]--------------\n")

let dict = ["A": "Apple", "B": "Banana", "C": "City"]

for (key, value) in dict {
  print("\(key): \(value)")
}

for (key, _) in dict {
  print(key)
}

for (_, value) in dict {
  print(value)
}


var d = [String: [String]]()
//d["d"] = "A"  //arr가 아닌 string을 입력하라는것으로 판단해서 오류발생
d["d"] = ["A"]
d["d2"] = ["b", "c"]
d





let _ = [String: [String: Int]]()




//: [Next](@next)
