//: [Previous](@previous)
//: - - -
//: # Encapsulation
//: - - -

class Person {
    private var location: String = "seoul"
    private var ticket: Bool = false
    func currentLocation() {
        print(location)
    }
 
    private func buyTicket() {
        ticket = true
        print("i bought busan train ticket")    //Q> 잘모르겠음
    }
    
    func goToBusan() {
        location = "Busan"
    }
}

let A = Person()
A.currentLocation()
A.goToBusan()
A.currentLocation()

