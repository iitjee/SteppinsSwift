/*

Terminology:
field/member      = Stored Property (in Apple)   -> can be provided by classes, structures, and enumerations.
property(get/set) = Computed Property (in Apple) -> provided only by classes and structures
                  = Type Property (in Apple)     ->    

-> Stored properties store const and var values as part of an instance, whereas computed properties calculate (rather than store) a value. 
-> Stored and computed properties are usually associated with instances of a particular type. However, properties can also be associated with the type itself. Such properties are known as TYPE PROPERTIES.
-> In addition, you can define PROPERTY OBSERVERS to monitor changes in a property’s value, which you can respond to with custom actions. Property observers can be added to stored properties you define yourself, and also to properties that a subclass inherits from its superclass.



*/



/* Class Initialization */
class VideoMode {
    var resolution = Resolution() 
    var interlaced = false  //default value of false
    var frameRate = 0.0     //default value of 0.0
    var name: String?       //default value of nil
    var company: String     //default value given in initializer ("Canon")
    let constProperty: Int  //no value initialized in definition, so user must ensure to provide a value to it when instantiating
 
    
    
    /*  Initialization  */
    init() {
    company = "Canon"   
    }
    
    init(comp: String) {
    company = comp
    }
    
    /*  Deinitalization */
    deinit {
    
    }
    
    /*  Normal Function   */
    func normalFunction() {
    
    }
    
    /*  Final Function  */
    final func printName(name: String) {   //final => Subclass can't override it
    print("Video company name is \(name)")
    }
    
       /* Static Variables */
    static var numberOfVideos = 0;  //same variable reference for all the class objects. (changing this in one object will reflect in all other objects as well.)
    
    /*  Static Functions */
    
    
    /*Lazy Variable */
    lazy var companyInfo = Company()    //Here company is some class. The Company instance for the companyInfo property is only created when the companyInfo property is first accessed.
    
    
}

/*  Instantiation:  Classes and Structs MUST set all of their stored properties to an appropriate initial value by the time an instance of that class or Struct is created. */
let someVideoMode = VideoMode()
//interlaced, frameRate, name has default values whereas company is given value with "initializer"


/* Classes are reference types  */
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0
//This example declares a new constant called tenEighty and sets it to refer to a new instance of the VideoMode class. 
let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0
//Because classes are reference types, tenEighty and alsoTenEighty actually both refer to the same VideoMode instance. so tenEightly.frameRate is also 30.0 now.

//V.IMP NOTE: Note that tenEighty and alsoTenEighty are declared as constants, rather than variables. 
//However, you can still change tenEighty.frameRate and alsoTenEighty.frameRate because the values of the tenEighty 
// and alsoTenEighty constants themselves do not actually change. 
// tenEighty and alsoTenEighty themselves do not “store” the VideoMode instance—instead, they both refer to a VideoMode instance behind the scenes.
// It is the frameRate property of the underlying VideoMode that is changed, not the values of the constant references to that VideoMode.
//(However, this is not true in structs for they being value types. When an instance of a value type is marked as a constant, so are all of its properties.)

/* Identity Operators(=== and !==) */
//Because classes are reference types, it is possible for multiple constants and variables to refer to the same single instance of a class behind the scenes. (The same is not true for structures and enumerations, because they are always copied when they are assigned to a constant or variable, or passed to a function.)
if tenEighty === alsoTenEighty {
    print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
}

//Note that “identical to” (represented by three equals signs, or ===) does not mean the same thing as “equal to” (represented by two equals signs, or ==):
//“Identical to” means that two constants or variables of class type refer to exactly the same class instance.
//“Equal to” means that two instances are considered “equal” or “equivalent” in value, for some appropriate meaning of “equal”, as defined by the type’s designer.(one can define one's own implementations of the “equal to” and “not equal to” operators using Equivalence Operators.


/* Swift Collections */
//In Swift, many basic data types such as String, Array, and Dictionary are implemented as structures. This means that data such as strings, arrays, and dictionaries are copied when they are assigned to a new constant or variable, or when they are passed to a function or method.
//This behavior is different from Foundation: NSString, NSArray, and NSDictionary are implemented as classes, not structures. Strings, arrays, and dictionaries in Foundation are always assigned and passed around as a reference to an existing instance, rather than as a copy.
// The behavior you see in your code will always be as if a copy took place. However, Swift only performs an actual copy behind the scenes when it is absolutely necessary to do so. Swift manages all value copying to ensure optimal performance, and you should not avoid assignment to try to preempt this optimization.

/* Stored Properties and iVars  */
//ObjC provides two ways to store values and references as part of a class instance. 
//In addition to properties, you can use instance variables as a backing store for the values stored in a property.

//Swift unifies these concepts into a single property declaration.
//A Swift property does not have a corresponding instance variable, and the backing store for a property is not accessed directly.
//This approach avoids confusion about how the value is accessed in different contexts and simplifies the property’s declaration into a single, definitive statement. 
//All information about the property—including its name, type, and memory management characteristics—is defined in a single location as part of the type’s definition.



/*   Lazy Variable   */
//A lazy stored property is a property whose initial value is not calculated until the first time it is used. 
//You must always declare a lazy property as a variable (with the var keyword), because its initial value might not be retrieved until after instance initialization completes.
//Constant properties must always have a value before initialization completes, and therefore cannot be declared as lazy.
//Two Uses:
// -> when the initial value for a property is dependent on outside factors whose values are not known until after an instance’s initialization is complete. 
// -> when the initial value for a property requires complex or computationally expensive setup that should not be performed unless or until it is needed.

//If a property marked with the lazy modifier is accessed by multiple threads simultaneously and the property has not yet been initialized, there is no guarantee that the property will be initialized only once.

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
        get {
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


/*  Static Methods  */
//Static methods cannot be overridden by subclasses. => acting like 'final'
//Static methods are lazy by default.

/* Deinitializtion  */
//Unlike in langs like Java or C# where unused variables are cleared at some "random point of time" (Called Garbage Collection) in Swift, you exactly know when the variable is being cleared. (Called Reference Counting)







