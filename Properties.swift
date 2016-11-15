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

/* Property Observers */
