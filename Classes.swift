/*



*/



/* Class Initialization */
class VideoMode {
    var resolution = Resolution() 
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

/*  Instantiation */
let someVideoMode = VideoMode()


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
and alsoTenEighty constants themselves do not actually change. 
tenEighty and alsoTenEighty themselves do not “store” the VideoMode instance—instead, they both refer to a VideoMode instance behind the scenes.
It is the frameRate property of the underlying VideoMode that is changed, not the values of the constant references to that VideoMode.

/* Identity Operators(=== and !==) */
//Because classes are reference types, it is possible for multiple constants and variables to refer to the same single instance of a class behind the scenes. (The same is not true for structures and enumerations, because they are always copied when they are assigned to a constant or variable, or passed to a function.)
if tenEighty === alsoTenEighty {
    print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
}

//Note that “identical to” (represented by three equals signs, or ===) does not mean the same thing as “equal to” (represented by two equals signs, or ==):
//“Identical to” means that two constants or variables of class type refer to exactly the same class instance.
//“Equal to” means that two instances are considered “equal” or “equivalent” in value, for some appropriate meaning of “equal”, as defined by the type’s designer.(one can define one's own implementations of the “equal to” and “not equal to” operators using Equivalence Operators.










