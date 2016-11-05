/*
https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/ControlFlow.html

1. Even for single if statement, you've to put braces
2. Switch statements doesn't suffer from fallthrough
3. It's mandatory to put a default case(or a"general" case) in Switch statements to make sure it's exhaustive.

*/


/*  for */
for _ in 1..5 { //_ is called wildcard
  print("Hello")
}

/*  repeat-while  */
repeat {


} while condition

/*  Labeled Statements  */
//Loops and conditional statements can both use the 'break' to end their execution prematurely. (whereas 'continue' only for loops)
//Therefore, it is sometimes useful to be explicit about which loop or conditional statement you want a break statement to terminate.
//(or 'continue' for loops)

myLabel: while somecondition {
  if otherCondition {continue myLabel}
  if someOtherCondition {break myLabel}
}

outerLabel: if someCondition {
  innerLabel: if otherCondition {
    if someAnotherCondition {break outerLabel}
    if yetAnotherCondition {break innerLabel}
  }
}

/* Switch-Case statement  */
let someItem: Character = "w"

switch someItem {
    case "a", "e", "i", "o", "u":
        print("Letter is vowel")
    
    case "a"..."z":
        print("Letter is consonant")
        
    default:
        print("It's not an alphabet")
}
//Note that there is no `break` in cases. Also, one can use the keyword `fallthrough` if you need that behavior (see below)
//if you use "fallthrough" in every case, it's nothing but an if+else-if statement :)
let someItem: Character = "w"
switch someItem {
    case "a", "e", "i", "o", "u":
        print("Letter is vowel")
    case "a"..."z":
        fallthrough
    default:
        print("Letter is a consonant")
}

/* Switch-Case with Tuples and WHERE clause */
let aPoint = (1.0, 2.0)
switch aPoint {
  case (let x, 2.0): print(x)
  case (1.0, let y): print(y)
  case let (x, y) where x>0.0 && y>0.0: print("\(y), \(x)")
  case let (x, y): print("\(y), \(x)")  //note that this is equivalent to default but if u use default, you don't have labels for tuple members
//(though you can get them by aPoint.1 and aPoint.9)
}


//if u want to use default statement, you could give labels to tuple members
let aPoint = (x:1.0, y:2.0)
switch aPoint {
//...
  default: print("\(aPoint.y), \(aPoint.x)")
}

//few left

/* Switch-Case with Enums */











