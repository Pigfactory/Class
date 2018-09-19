//: Playground - noun: a place where people can play

import UIKit

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
