import UIKit


typealias aliasClosure = (Int) -> Int

var closureDeclaration: aliasClosure

var closureDefinition = { intVal in
    return intVal*5
}

closureDefinition(5)

//Passing Closure as a function parameter and returning closure
func test(_ closure: @escaping aliasClosure) -> aliasClosure {
    let val = closure(2)
    let temp = { res in
        return res * val
    }
    return temp
}

var returnClosure = test(closureDefinition)
returnClosure(6)

//Closure that doesnot returns value
func test2(_ closure: @escaping aliasClosure) {
     closure(2) //Calling closure definition with arguement - Int (2)
}

test2({ result in //Passing closure as a arguement)
    return result*(-10)
})


//Closure that contains statements but no arguements but return type exists
func testReturnType( closureR:@escaping () -> Int) {
    print("testStatement called")
    print(closureR()) // This will make to call the passed arguement and execute it
}
testReturnType { () -> Int in
    return 1
}

//Closure that contains statements but no arguements or no return type
func testStatement( closureT:@escaping () -> ()) {
    print("testStatement called")
    print(closureT()) // This will make to call the passed arguement and execute it
}
testStatement {
    print("testStatement Closure called")
}

//Trailing closure
func testTrailing(_ a: Int, trailingClosure: aliasClosure) {
    print(a)
    print(trailingClosure(8))
}
testTrailing(11) { (result) -> Int in //11 - first arguement , closure is second arguement
    print(result)
    return result * (-2)
}


// Autoclosure - @autoclosure keyword creates an automatic closure around the expression by adding a {}. Therefore, you can omit braces {} when passing closures to a function.
func testAutoClosure(_ closure: @autoclosure () -> Void) {
    print("testAutoClosure called")
}
testAutoClosure(())

//Completion handler
func doWork(completion:()->()) {
    print("before calling callback")
    completion()
    print("after calling callback")
}

doWork(completion: {
    print("call back received")
})

print("Other statements")

var array = [2,1,3,4,7,6,5]
//As a function parameter:
array.sorted(by: { (item1: Int, item2: Int) -> Bool in return item1 < item2 })
//As a function parameter with implied types:
array.sorted(by: { (item1, item2) -> Bool in return item1 < item2 })
//As a function parameter with implied return type:
array.sorted(by: { (item1, item2) in return item1 < item2 })
//As the last function parameter:
array.sorted { (item1, item2) in return item1 < item2 }
//As the last parameter, using shorthand argument names:
array.sorted { return $0 < $1 }
//As the last parameter, with an implied return value:
array.sorted { $0 < $1 }
//As the last parameter, as a reference to an existing function:
array.sorted(by: <)
//As a function parameter with explicit capture semantics:
array.sorted(by: { (item1: Int, item2: Int) -> Bool in return item1 < item2 })

