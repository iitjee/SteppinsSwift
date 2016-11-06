/*



*/


/*  Function references */
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
