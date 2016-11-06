/*



*/


/*  Function references */  //Functions are "first-class" objects
func sayHello() {print("Hello IIT")}
var talk = sayHello //implicit type inference
var talkAgain: ()->() = sayHello  //explicitly mentioning type

//Calling
sayHello()  //same as
talk()      //same as
talkAgain()

//remember like this, when assigning you just give name without parans but while calling you put parans! as simple as that! :)

/*Passing function references as arguments  */
func speak(damnTalk :()->()) {
  damnTalk()
  }
  
//Calling
speak(damnTalk:sayHello)


/*  Returning function references */


/*  Nested Functions  */
//All the functions which we've seen so far are global functions, which are defined at global scope.
//You can also define functions inside the bodies of other functions, known as nested functions.

//IMPORTANT: Nested functions are hidden from the outside world by default, but can still be called and used by their enclosing function.
//An enclosing function can also return one of its nested functions to allow the nested function to be used in another scope.
  
func chooseStepFunction(backward: Bool) -> (Int) -> Int { //(Int) is not a single member tuple. ;) You should see (Int) -> Int which indicates that a function reference is being returned
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backward ? stepBackward : stepForward
} //Just like when assigning, while returning function references, we don't use parans().

var currentValue = -4
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
// moveNearerToZero now refers to the nested stepForward() function
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")
// -4...
// -3...
// -2...
// -1...
// zero!



/*  Closures  */
//Closures can capture and store references to any constants and variables from the context in which they are defined. 
//This is known as closing over those constants and variables. 
//Swift handles all of the memory management of capturing for you.

(arguments) -> returnType in ClosureBody_NobracesReq

func toDouble(x: Int) -> Double {  return Double(x) }
//closure equivalents to above line
let ref: (Int) -> Double =  {(x: Int)  -> Double in return Double(x) } //here we have explicitly mentioned the type of ref
let ref = {(x: Int) -> Double in return Double(x)}  //type inference
let ref = {(x: Int) in return Double(x)}  //return type never mentioned
let ref: (Int) -> Double = {x in return Double(x)}  //type of x can be inferred from the mentioned signature of `ref`
let ref: (Int) -> Double = {return Double($0)}  //from the signature it can be seen that there is one Int arg (acc by $0)
let ref: (Int) -> Double = {Double($0)} //since function body has only one statement, `return` keyword can be omitted

//Calling
print(ref(2));


/*  Global and nested functions are actually special cases of closures.
Closures take one of three forms:
Global functions are closures that have a name and do not capture any values.
Nested functions are closures that have a name and can capture values from their enclosing function.
Closure expressions are unnamed closures written in a lightweight syntax that can capture values from their surrounding context.

*/























