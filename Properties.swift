/*  Computed Properties */
//In addition to stored properties, classes, structures, and enumerations can define computed properties, which do not actually store a value. 
//Instead, they provide a getter and an optional setter to retrieve and set other properties and values indirectly.
struct Point {  // "Point 'encapsulates' the x- and y-coordinate of a point"
    var x = 0.0, y = 0.0
}
struct Size {   //"Size 'encapsulates' a width and a height"
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get { precondition(size.width>0)  //now if the precondition fails, prog crashes abruptly!(Use with caution!!)
             //(http://stackoverflow.com/questions/29673027/difference-between-precondition-and-assert-in-swift)
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
      //Alternatively you can use short-hand notation for set as well
//        set {
//             origin.x = newValue.x - (size.width / 2) //newValue is a reserved keyword for this purpose
//             origin.y = newValue.y - (size.height / 2)
//         }
    }
}
var square = Rect(origin: Point(x: 0.0, y: 0.0),
                  size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
print("square.origin is now at (\(square.origin.x), \(square.origin.y))") // Prints "square.origin is now at (10.0, 10.0)"


/*  Read-Only Computed Properties */
//You must declare computed properties—including read-only computed properties—as variable properties with the var keyword, because their value is not fixed.
//'let' is only used for constant properties, to indicate that their values cannot be changed once they are set as part of instance initialization.
struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {  //note that 'get' can be omitted for these :)
        return width * height * depth
    }
}
let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)") //prints 40.0

/*   Property Observers      */
//Property observers are called every time a property’s value is set, even if the new value is the same as the property’s current value.
//You can add property observers to any stored properties you define, except for lazy stored properties.
//You can also add property observers to any inherited property (whether stored or computed) by overriding the property within a subclass. 
//You don’t need to define property observers for nonoverridden computed properties, because you can observe and respond to changes to their value in the computed property’s setter.

//IMPORTANT: When you assign a default value to a stored property, or set its initial value within an initializer, the value of that property is set directly, without calling any property observers.



// - willSet is called just before the value is stored.
    //If you implement a willSet observer, it’s passed the new property value as a constant parameter.
    //You can name the parameter or use the default parameter name of newValue

// - didSet is called immediately after the new value is stored.
    //if you implement a didSet observer, it’s passed a constant parameter containing the old property value. 
    //You can name the parameter or use the default parameter name of oldValue
//Note: If you assign a value to a property within its own didSet observer, the new value that you assign replaces the one that was just set


//IMPORTANT NOTE:The willSet and didSet observers of superclass properties are called when a property is set in a subclass initializer, after the superclass initializer has been called.
//They are not called while a class is setting its own properties, before the superclass initializer has been called.

class StepCounter {
    var totalSteps: Int = 0 {
        
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue  { //Note that the didSet observer does not provide a custom parameter name for the old value, and the default name of oldValue is used instead.
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200    // About to set totalSteps to 200   // Added 200 steps
stepCounter.totalSteps = 360    // About to set totalSteps to 360   // Added 160 steps
stepCounter.totalSteps = 896    // About to set totalSteps to 896   // Added 536 steps


//If you pass a property that has observers to a function as an in-out parameter, the willSet and didSet observers are always called.
//This is because of the copy-in copy-out memory model for in-out parameters: The value is always written back to the property at the end of the function.

/* Constant Properties  (borrowed from initializer section) */
//IMPORTANT: You can assign a value to a constant property at any point during initialization, as long as it is set to a definite value by the time initialization finishes. Once a constant property is assigned a value, it can’t be further modified.
//IMPORTANT: For class instances, a constant property can be modified during initialization only by the class that introduces it. It cannot be modified by a subclass.
class SurveyQuestion {
    let text: String    //Even though the text property is now a constant, it can still be set within the class’s initializer:
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}
let beetsQuestion = SurveyQuestion(text: "How about beets?")
beetsQuestion.ask() // Prints "How about beets?"
beetsQuestion.response = "I also like beets. (But not with cheese.)"




