/*
1. By default, the parameters are `constants` unless declared with a var keyword
2. A function may have at most one variadic parameter
3. In langs like C++ and C#, passing by reference is the only way to get multiple return values. However in swift we have
   tuples. So In-Out parameters are generally not used and use only when required :)


*/




func greet(person: String) -> String {  //Note that person is a constant string
    let greeting = "Hello, " + person + "!"
    return greeting
}
print(greet(person: "Anna"))

/* No more valid, You can't have var keyword used in function arguments 
func greet(var person: String) -> String {  //Note that person is now a variable string
    var person = "Hello, " + person + "!"
    return person
}
print(greet(person: "Anna"))
*/

/* Functions with no return values  */
func greet(person: String) {
    print("Hello, \(person)!")
}
//Note: Strictly speaking the function is still returning a value of type Void which is an empty tuple ()
func greet(person: String) -> () { //both are same
    print("Hello, \(person)!")
}

/*  Functions with Multiple Return Values */
func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
print("min is \(bounds.min) and max is \(bounds.max)")
// Prints "min is -6 and max is 109"
//Note that the tuple’s members do not need to be named at the point that the tuple is returned from the function, because their names are already specified as part of the function’s return type.


/*  Functions with Optional Tuple Return Types */
// the minMax(array:) function above does not perform any safety checks on the array it is passed. If the array argument contains an empty array, the minMax(array:) function, as defined above, will trigger a runtime error when attempting to access array[0].

func minMax(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty { return nil }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

if let bounds = minMax(array: [8, -6, 2, 109, 3, 71]) { //Optional Binding
    print("min is \(bounds.min) and max is \(bounds.max)")
}
// Prints "min is -6 and max is 109"


/*  Function Argument Labels(aka external name) and Parameter Names(aka internal name)  (Awesome!! :))*/
//All parameters must have unique names. Although it’s possible for multiple parameters to have the same argument label, unique argument labels help make your code more readable.
func someFunction(argumentLabel parameterName: Int) {
    // In the function body, parameterName refers to the argument value
    // for that parameter.
}

func greet(person: String, from hometown: String) -> String {
    return "Hello \(person)!  Glad you could visit from \(hometown)."
}
print(greet(person: "Bill", from: "Cupertino")) // Prints "Hello Bill!  Glad you could visit from Cupertino."
//The use of argument labels can allow a function to be called in an expressive, sentence-like manner, while still providing a function body that is readable and clear in intent.

//Note: If a parameter has an argument label, the argument must be labeled when you call the function.
//Note2: There's no point if you put same names for both external and internal names. Infact you get a warning when u do so

/*  Omitting Argument Labels and Parameter Names */
func someFunction(_ firstParameterName: Int, secondParameterName: Int) {
    // In the function body, firstParameterName and secondParameterName
    // refer to the argument values for the first and second parameters.
}
someFunction(1, secondParameterName: 2)


/*  Default Parameter Values  */
func someFunction(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
    // If you omit the second argument when calling this function, then
    // the value of parameterWithDefault is 12 inside the function body.
}
someFunction(parameterWithoutDefault: 3, parameterWithDefault: 6) // parameterWithDefault is 6
someFunction(parameterWithoutDefault: 4) // parameterWithDefault is 12
//Note: Since one can ignore typing the defaultParameterName, you should always keep them at last, after the usual args are mentioned


/* Arrays as arguments  */
func concatenate(_ strings :[String], delimitingBy separator: String=", ") -> String {
   var result = ""
   for word in strings {
      result += (word + separator)
   }
   return result
}
concatenate(["a", "b", "c"], delimitingBy: "\n")   //here delimited by newlien
concatenate(["a", "b", "c"])  //here delimited by ,

/*  Function overloading  */
//If argument signature or the return signature is different, functions can be overloaded
//Also functions with different external names with same signature are considered different

func myOverload(x: Int)
func myOverload(x: Int, y: Int) -> (Int, Int) 
func myOverload(x: Double) -> Int
func myOverload(a a:Int)
func myOverload(b b:Int)
func myOverload(c c:Int)

/*  Tuples as arguments */
func findCenter(start: (y: Int, x: Int), _ end: (Int, Int)) -> (y: Int, x: Int) {
//Note that in first arg, we have given labels to tuple members which we didn't for the second arg
   //...
}

findCenter(start:(1,2), (5, 2))

/* Variadic Parameters  */
//Note: A function may have at most one variadic parameter.
func arithmeticMean(numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(numbers: 1, 2, 3, 4, 5)   // returns 3.0, which is the arithmetic mean of these five numbers
arithmeticMean(numbers: 3, 8.25, 18.75)  // returns 10.0, which is the arithmetic mean of these three numbers

/*  In-Out parameters   */
//They are an alternative way for a function to have an effect outside of the scope of its function body.
func swapTwoInts(_ a: inout Int, _ b: inout Int) {  //this is the only case where argument variables are not constants
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)  //You place an ampersand (&) directly before a variable’s name when you pass it as an argument to an in-out parameter, to indicate that it can be modified by the function.
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")// Prints "someInt is now 107, and anotherInt is now 3"

//Note: Usually not recommended
//IMP: In-out parameters cannot have default values, and variadic parameters cannot be marked as inout.


/*  An Enum example */
enum Status {
case success, failure
}

func doSomething(result: inout String) -> Status {
    result = "New value"
    return .success //Status.success is not mentioned because return type is already given in function declaration
}
//In this example, notice that we modify the variable passed to the function as well as return something! 
//But this is not the best way to do so. When you want to return two variables use tuples instead of in-out like this

func doSomething(Status: status, result: String) {
    result = "New value"
    return (.success,  result)
}

